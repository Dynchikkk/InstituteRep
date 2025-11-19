#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>

#define BUFFER_SIZE 256

// -------------------------------------------------------
// Function: read_filename_from_user
// Reads filename from terminal input
// -------------------------------------------------------
void read_filename_from_user(char* filename) {
    printf("Enter filename: ");
    scanf("%255s", filename);
}

// -------------------------------------------------------
// Function: send_filename_to_child
// Parent sends filename to child through pipe
// -------------------------------------------------------
void send_filename_to_child(int pipe_fd, const char* filename) {
    write(pipe_fd, filename, strlen(filename) + 1);
}

// -------------------------------------------------------
// Function: child_process_work
// Child: receives filename → opens file → sends lines to parent
// -------------------------------------------------------
void child_process_work(int read_fd, int write_fd) {
    char filename[BUFFER_SIZE];

    // Read filename from parent
    read(read_fd, filename, BUFFER_SIZE);
    printf("Child: received filename '%s'\n", filename);

    FILE* file = fopen(filename, "r");
    if (!file) {
        perror("Child: cannot open file");
        exit(EXIT_FAILURE);
    }

    char line[BUFFER_SIZE];

    // Read file line by line and send to parent
    while (fgets(line, BUFFER_SIZE, file) != NULL) {
        write(write_fd, line, strlen(line));
    }

    fclose(file);
}

// -------------------------------------------------------
// Function: parent_process_work
// Parent: waits for lines from child and prints them
// -------------------------------------------------------
void parent_process_work(int read_fd) {
    char buffer[BUFFER_SIZE];
    ssize_t bytes_read;

    printf("Parent: waiting for lines...\n\n");

    // Read lines from child until pipe is closed
    while ((bytes_read = read(read_fd, buffer, BUFFER_SIZE - 1)) > 0) {
        buffer[bytes_read] = '\0';
        printf("From child: %s", buffer);
    }

    printf("\nParent: child finished.\n");
}

// -------------------------------------------------------
// Function: create_pipes
// Creates two pipes and checks errors
// -------------------------------------------------------
void create_pipes(int p2c[2], int c2p[2]) {
    if (pipe(p2c) == -1 || pipe(c2p) == -1) {
        perror("pipe");
        exit(EXIT_FAILURE);
    }
}

// -------------------------------------------------------
// MAIN
// -------------------------------------------------------
int main() {
    int pipe_parent_to_child[2];
    int pipe_child_to_parent[2];

    create_pipes(pipe_parent_to_child, pipe_child_to_parent);

    pid_t pid = fork();

    if (pid < 0) {
        perror("fork");
        exit(EXIT_FAILURE);
    }

    // ===========================
    // ===== CHILD PROCESS =======
    // ===========================
    if (pid == 0) {

        close(pipe_parent_to_child[1]); // close write end
        close(pipe_child_to_parent[0]); // close read end

        child_process_work(pipe_parent_to_child[0],
            pipe_child_to_parent[1]);

        close(pipe_parent_to_child[0]);
        close(pipe_child_to_parent[1]);

        exit(EXIT_SUCCESS);
    }

    // ===========================
    // ===== PARENT PROCESS ======
    // ===========================
    else {

        close(pipe_parent_to_child[0]); // close read end
        close(pipe_child_to_parent[1]); // close write end

        char filename[BUFFER_SIZE];

        read_filename_from_user(filename);
        send_filename_to_child(pipe_parent_to_child[1], filename);

        parent_process_work(pipe_child_to_parent[0]);

        close(pipe_parent_to_child[1]);
        close(pipe_child_to_parent[0]);

        wait(NULL);
    }

    return 0;
}
