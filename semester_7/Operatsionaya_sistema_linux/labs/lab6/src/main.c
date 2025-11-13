#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>

/*
 * Signal handler for SIGINT
 * (Triggered when Ctrl+C is pressed or when SIGINT is sent to the process)
 */
void sigint_handler(int signum) {
    printf("Handler: received SIGINT (signal %d)\n", signum);
}

/*
 * Function to print the current signal mask
 */
void print_mask(const char* msg) {
    sigset_t current_mask;
    sigprocmask(SIG_SETMASK, NULL, &current_mask); // get current mask

    printf("%s\n", msg);
    for (int i = 1; i < NSIG; i++) {
        if (sigismember(&current_mask, i))
            printf("  Signal %d is blocked\n", i);
    }
    printf("\n");
}

int main() {
    // Set a handler for SIGINT
    if (signal(SIGINT, sigint_handler) == SIG_ERR) {
        perror("Error while setting signal handler");
        exit(EXIT_FAILURE);
    }

    printf("Process PID: %d\n", getpid());

    // Print current signal mask
    print_mask("Current signal mask:");

    // Send SIGINT to the current process
    printf("Sending SIGINT to myself...\n");
    raise(SIGINT);

    // Create a new mask and block SIGINT
    sigset_t new_mask;
    sigemptyset(&new_mask);
    sigaddset(&new_mask, SIGINT);
    sigprocmask(SIG_BLOCK, &new_mask, NULL);

    // Print updated mask
    print_mask("After blocking SIGINT:");

    // Try to send SIGINT again
    printf("Sending SIGINT again (it will be blocked)...\n");
    raise(SIGINT);
    printf("SIGINT is blocked and waiting to be unblocked.\n");

    // Unblock SIGINT
    sigprocmask(SIG_UNBLOCK, &new_mask, NULL);
    printf("SIGINT unblocked — pending signal should be delivered now.\n");

    // Pause program to wait for manual signal (Ctrl+C)
    printf("Press Ctrl+C to send SIGINT manually.\n");
    pause();

    printf("Program finished.\n");
    return 0;
}
