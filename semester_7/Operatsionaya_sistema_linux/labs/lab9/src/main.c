#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <unistd.h>
#include <signal.h>

#define MAX_TEXT 256

// Message structure
struct msgbuf {
    long mtype;
    char mtext[MAX_TEXT];
};

// Global variables to allow cleanup in signal handler
int g_qid = -1;        // Message queue ID
int g_is_creator = 0;  // Will be 1 if this process created the queue

/*=========================================================
  Signal handler for cleanup (delete queue)
=========================================================*/
void handle_sigint(int sig) {
    if (g_is_creator && g_qid != -1) {
        printf("\nRemoving message queue...\n");
        msgctl(g_qid, IPC_RMID, NULL);
    }
    printf("Exiting.\n");
    exit(0);
}

/*=========================================================
  1. Get user ID from program arguments
=========================================================*/
long get_user_id(int argc, char* argv[]) {
    if (argc != 2) {
        printf("Usage: %s <user_id>\n", argv[0]);
        exit(1);
    }

    long id = atol(argv[1]);
    if (id <= 0) {
        printf("User ID must be > 0\n");
        exit(1);
    }

    return id;
}

/*=========================================================
  2. Create or connect to the message queue
=========================================================*/
int create_queue() {
    // Generate key from existing file
    key_t key = ftok("../main.c", 'A');
    if (key == -1) {
        perror("ftok");
        exit(1);
    }

    // Try to create queue exclusively — to detect creator
    int qid = msgget(key, IPC_CREAT | IPC_EXCL | 0666);
    if (qid == -1) {
        // Queue already exists -> connect to it
        qid = msgget(key, 0666);
        if (qid == -1) {
            perror("msgget");
            exit(1);
        }
        printf("Connected to existing queue.\n");
        g_is_creator = 0;
    }
    else {
        printf("Created a new message queue.\n");
        g_is_creator = 1; // NEW — this process created the queue
    }

    return qid;
}

/*=========================================================
  3. Receiver process
=========================================================*/
void run_receiver(int qid, long user_id) {
    struct msgbuf msg;

    while (1) {
        ssize_t r = msgrcv(qid, &msg, sizeof(msg.mtext), user_id, 0);

        if (r > 0) {
            printf("\n[Received]: %s\n", msg.mtext);
            printf("> ");
            fflush(stdout);
        }
    }
}

/*=========================================================
  4. Sender process
=========================================================*/
void run_sender(int qid, long user_id) {
    struct msgbuf msg;
    char text[MAX_TEXT];

    while (1) {
        long to;

        printf("> ");
        scanf("%ld", &to);
        fgets(text, MAX_TEXT, stdin);

        msg.mtype = to;
        snprintf(msg.mtext, MAX_TEXT, "From %ld:%s", user_id, text);

        if (msgsnd(qid, &msg, strlen(msg.mtext) + 1, 0) == -1) {
            perror("msgsnd");
        }
    }
}

/*=========================================================
  Main function
=========================================================*/
int main(int argc, char* argv[]) {
    long user_id = get_user_id(argc, argv);
    int qid = create_queue();

    // Save globally for cleanup
    g_qid = qid;

    // Register signal handler for Ctrl+C
    signal(SIGINT, handle_sigint);  // NEW

    printf("User %ld connected.\n", user_id);
    printf("Message format:\n");
    printf("    <target_user_id> <text>\n");

    // Child -> receiver
    if (fork() == 0) {
        run_receiver(qid, user_id);
        exit(0);
    }

    // Parent -> sender
    run_sender(qid, user_id);

    return 0;
}
