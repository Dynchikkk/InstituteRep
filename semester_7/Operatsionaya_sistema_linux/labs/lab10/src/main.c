#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/sem.h>
#include <sys/wait.h>
#include <sys/time.h>

#define FILE_NAME "data.txt"

// Required user-defined union for semctl()
union semun {
    int val;
    struct semid_ds *buf;
    unsigned short *array;
};

// Shared memory structure
typedef struct {
    int rows, cols;
    int matrixA[100][100];
    int matrixB[100][100];
    int matrixC[100][100];
    int nextRowToCompute;
} SharedData;

/*===============================
        Semaphore helpers
================================*/

// P(): lock semaphore
void semaphore_lock(int semId) {
    struct sembuf op = {0, -1, 0};
    semop(semId, &op, 1);
}

// V(): unlock semaphore
void semaphore_unlock(int semId) {
    struct sembuf op = {0, +1, 0};
    semop(semId, &op, 1);
}

/*===============================
    Shared memory & semaphore
================================*/

SharedData* allocate_shared_memory(int *shmId) {
    key_t key = ftok(".", 'S');
    if (key == -1) { perror("ftok"); exit(1); }

    *shmId = shmget(key, sizeof(SharedData), IPC_CREAT | 0666);
    if (*shmId < 0) { perror("shmget"); exit(1); }

    SharedData *sh = shmat(*shmId, NULL, 0);
    if (sh == (void*)-1) { perror("shmat"); exit(1); }

    return sh;
}

int create_mutex_semaphore() {
    key_t key = ftok(".", 'M');
    if (key == -1) { perror("ftok"); exit(1); }

    int semId = semget(key, 1, IPC_CREAT | 0666);
    if (semId < 0) { perror("semget"); exit(1); }

    union semun u;
    u.val = 1;
    semctl(semId, 0, SETVAL, u);

    return semId;
}

/*===============================
        File I/O
================================*/

void load_matrices_from_file(SharedData *sh) {
    FILE *f = fopen(FILE_NAME, "r");
    if (!f) { perror("open file"); exit(1); }

    fscanf(f, "%d %d", &sh->rows, &sh->cols);

    for (int i = 0; i < sh->rows; i++)
        for (int j = 0; j < sh->cols; j++)
            fscanf(f, "%d", &sh->matrixA[i][j]);

    for (int i = 0; i < sh->rows; i++)
        for (int j = 0; j < sh->cols; j++)
            fscanf(f, "%d", &sh->matrixB[i][j]);

    fclose(f);
}

void save_result_to_file(SharedData *sh) {
    FILE *f = fopen(FILE_NAME, "w");
    if (!f) { perror("open file"); exit(1); }

    fprintf(f, "%d %d\n", sh->rows, sh->cols);

    for (int i = 0; i < sh->rows; i++) {
        for (int j = 0; j < sh->cols; j++)
            fprintf(f, "%d ", sh->matrixA[i][j]);
        fprintf(f, "\n");
    }

    for (int i = 0; i < sh->rows; i++) {
        for (int j = 0; j < sh->cols; j++)
            fprintf(f, "%d ", sh->matrixB[i][j]);
        fprintf(f, "\n");
    }

    for (int i = 0; i < sh->rows; i++) {
        for (int j = 0; j < sh->cols; j++)
            fprintf(f, "%d ", sh->matrixC[i][j]);
        fprintf(f, "\n");
    }

    fclose(f);
}

/*===============================
        Worker process
================================*/

void print_timestamp() {
    struct timeval tv;
    gettimeofday(&tv, NULL);

    struct tm *tm = localtime(&tv.tv_sec);

    printf("[%02d:%02d:%02d.%03ld%03ld] ",
           tm->tm_hour,
           tm->tm_min,
           tm->tm_sec,
           tv.tv_usec / 1000,
           tv.tv_usec % 1000
    );
}

void compute_rows_worker(SharedData *sh, int semId) {
    while (1) {
        semaphore_lock(semId);

        int row = sh->nextRowToCompute;
        if (row >= sh->rows) {
            semaphore_unlock(semId);
            exit(0);
        }

        sh->nextRowToCompute++;
        semaphore_unlock(semId);

        // PRINT START MESSAGE WITH TIME
        print_timestamp();
        printf("PID %d START row %d\n", getpid(), row);

        for (int j = 0; j < sh->cols; j++) {
            sh->matrixC[row][j] = sh->matrixA[row][j] + sh->matrixB[row][j];
        }

        // PRINT FINISH MESSAGE WITH TIME
        print_timestamp();
        printf("PID %d END   row %d\n", getpid(), row);

        usleep(20000); // simulate work
    }
}

/*===============================
                Main
================================*/

int main() {
    int shmId;
    SharedData *sh = allocate_shared_memory(&shmId);
    int semId = create_mutex_semaphore();

    load_matrices_from_file(sh);

    sh->nextRowToCompute = 0;

    for (int i = 0; i < sh->rows; i++)
        for (int j = 0; j < sh->cols; j++)
            sh->matrixC[i][j] = 0;

    for (int i = 0; i < sh->rows; i++) {
        if (fork() == 0) {
            compute_rows_worker(sh, semId);
            exit(0);
        }
    }

    while (wait(NULL) > 0);

    save_result_to_file(sh);

    printf("Result matrix:\n");
    for (int i = 0; i < sh->rows; i++) {
        for (int j = 0; j < sh->cols; j++)
            printf("%4d ", sh->matrixC[i][j]);
        printf("\n");
    }

    shmdt(sh);
    shmctl(shmId, IPC_RMID, NULL);
    semctl(semId, 0, IPC_RMID);

    return 0;
}
