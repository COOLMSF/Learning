/*
 * My test shell which provide these feature:
 *  1. Execute command correctly
 *  2. Handle environment variable correctly. ( I think it can be read from .myshellrc)
 *  3. Pipe supported
 *  4. Handle signal correctly
 *  5. Job, session supported
 *  6. History supported
 *
 * Problem:
 *  1. Synchronous the working directory with parent and child process
 *  2. Note, cd is a builtin command in shell, not a command in /bin/cd
 */

#include "allheaders.h"
#include "MyShell.h"

int main(int argc, char *argv[]) {

    int pid;
    int status;
    int builtin_flag = 0;


    char home_path[1024];
    char *child_working_path;
    char *parent_working_path;

    // Communicate with child, and tell parent child process' current
    // working directory, so parent process can change dir to it.
    // int pipe_fd[2];

    // if (pipe(pipe_fd) < 0)
    //     err(EXIT_FAILURE, "pipe");

    // // Signal
    // sigset_t sigset_old, sigset_new;

    // // Parent process should ignore SIGINT
    // sigemptyset(&sigset_old);
    // sigaddset(&sigset_old, SIGINT);

    // if (sigprocmask(SIG_BLOCK, &sigset_new, &sigset_old) < 0)
    //     err(EXIT_FAILURE, "sigpromask");

    char *cmd = malloc(MAX_CMD_LEN * sizeof(char));

    if (cmd == NULL)
        err(EXIT_FAILURE, "malloc");

    /*
     * Change directory to user's home, if home not found, change to root '/'
     */

    // Passwd structure, we can get username from it
    struct passwd *structpasswd;

    structpasswd = getpwuid(getuid());

    // Get full home path
    bzero(home_path, 1024);
    strcpy(home_path, "/home/");
    strcat(home_path, structpasswd->pw_name);

    // Change to home directory if exist
    // else change to '/'
    if (access(home_path, F_OK) == -1) {
        chdir("/");
        parent_working_path = "/";
    } else {
        chdir(home_path);
        parent_working_path = home_path;
    }

    for (;;) {

        // Reset flag
        builtin_flag = 0;

        // -lreadline
        cmd = readline(">> ");

        // If user type "exit", builtin cmd found
        if (strstr(cmd, "exit")) {

            // This is a built command, set flag on
            builtin_flag = 1;

            // Execute my own builtin function, rather than execute command in /bin
            builtin_exit(cmd);
        }

        // If "cd" string in cmd, builtin command found
        if (strstr(cmd, "cd")) {

            // Set flag on
            builtin_flag = 1;

            builtin_cd(cmd);
        }

        if ((pid = fork()) < 0) {
            err(EXIT_FAILURE, "fork");
        } else if (pid == 0) { // Child to execute command

            // Init signal
            // signal(SIGINT, sig_int_handler);

            // Number of args that provided
            int nargs = 1;

            // Point to each argument
            char *arg;

            char *arg_list[MAX_ARGS];

            // Malloc memory for each argument
            for (int i = 0; i < MAX_ARGS; ++i) {
                arg_list[i] = malloc(MAX_ARG_LEN);
            }

            /*
             * Extract all argument of command, which separated by space.
             */

            arg = strtok(cmd, " ");

            for (int i = 0; arg != NULL; ++i) {

                // Save argument to argument list
                arg_list[i] = arg;

                // Get next argument
                arg = strtok(NULL, " ");

                nargs++;
            }

            // The last argument must be NULL, or Bad address error
            arg_list[nargs -1] = NULL;

            // Only execute non builtin cmd
            if (!builtin_flag) {
                if (execv(arg_list[0], arg_list) == -1)
                    err(EXIT_FAILURE, "execv");
            }

        } else {    // parent
            if (wait(&status) != pid)
                err(EXIT_FAILURE, "wait");
        }
    }
}

void sig_int_handler(int a) {
    exit(EXIT_FAILURE);
}

void builtin_exit(char *cmd) {
    puts("User interrupted");
    exit(EXIT_SUCCESS);
}

void builtin_cd(char *cmd) {

    char *dir = strstr(cmd, "cd") + 1;
    // stacat(parent_dir, dir);
    if (chdir(parent_dir) < 0)
        err(EXIT_FAILURE, "chdir");
}

// CLT^L should supported
void builtin_clear(char *cmd) {
    execl("/usr/bin/clear", "clear", NULL);
}