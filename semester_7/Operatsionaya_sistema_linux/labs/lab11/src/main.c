#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <sys/types.h>

#define CHILD_COUNT 5

// Handler for SIGUSR1
void sigusr1_handler(int sig) {
    pid_t myPid = getpid();

    // Process becomes a leader of its own group: pgid = pid
    if (setpgid(0, 0) == -1) {
        perror("setpgid failed");
    }
    else {
        printf("[PID %d] Now I am the leader of my own group (PGRP = %d)\n",
            myPid, getpgrp());
    }
}

// Print process information for debugging
void print_info(const char* msg) {
    printf("[%s] PID=%d  PPID=%d  SID=%d  PGRP=%d\n",
        msg, getpid(), getppid(), getsid(0), getpgrp());
}


int main() {
    signal(SIGUSR1, sigusr1_handler);

    pid_t children[CHILD_COUNT];

    printf("Parent started.\n");
    print_info("PARENT INITIAL STATE");

    // Create 5 child processes
    for (int i = 0; i < CHILD_COUNT; i++) {
        pid_t pid = fork();

        if (pid < 0) {
            perror("fork failed");
            exit(1);
        }

        if (pid == 0) {
            // Child process
            print_info("CHILD CREATED");

            // Each child waits until SIGUSR1
            while (1) {
                sleep(1);
            }
        }

        // Parent stores child PID
        children[i] = pid;
    }

    printf("\n=== All children created. Check process groups ===\n");
    sleep(8);

    printf("\n=== Sending SIGUSR1 to all children ===\n");

    for (int i = 0; i < CHILD_COUNT; i++) {
        kill(children[i], SIGUSR1);
    }

    printf("Signals sent. Check process groups.\n");
    sleep(8);

    printf("\n=== Ending all child processes ===\n");
    for (int i = 0; i < CHILD_COUNT; i++) {
        kill(children[i], SIGTERM);
    }

    return 0;
}
