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

char home_path[1024];
char *child_working_path;
char *parent_working_path;

// Default PATH value, it should be written my PATH="Value"
char default_path_env[MAX_PAHT_LEN] = "/bin/";

// New PATH value
char new_path_env[MAX_PAHT_LEN] = { 0 };

// Full path for executable file
char full_exec_path[MAX_PAHT_LEN] = { 0 };

int pid;
int status;
int builtin_flag = 0;

int main(int argc, char *argv[]) {

    // signal(SIGINT, sig_int_handler);
    // Communicate with child, and tell parent child process' current
    // working directory, so parent process can change dir to it.
    // int pipe_fd[2];

    // if (pipe(pipe_fd) < 0)
    //     err(EXIT_FAILURE, "pipe");

    if (signal(SIGINT, kill_child) == SIG_ERR)
        err(EXIT_FAILURE, "signal");

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

    // Try to read configure file
    FILE *fp;
    fp = fopen(CONF_FILE, "r");

    if (fp) {
        set_env(fp);
    } else {
        // Configure file not found or something else wrong
        // Set default path
        char *tmp = "/bin/";

        strncpy(new_path_env, tmp, strlen(tmp));
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

            // Update parent working directory
            parent_working_path = get_current_dir_name();

            // This is a command, so continue this loop
            continue;
        }

        /*
         * If pipe symbol found, do something.
         * this if little me me, we should analyze every arguments in every
         * pipe command.
         * do it later.
        if (strstr(cmd, "|")) {
        }
         *

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

            /*
             * Synchronous parent working directory with child working directory
             * This is import, or you cannot cat file when cd, because shell doesn't
             * know where it is
            */
            if (chdir(parent_working_path))
                perror("chdir");

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

            // Get full_exec_path
            strcat(full_exec_path, strcat(new_path_env, arg_list[0]));

            // Only execute non builtin cmd
            if (!builtin_flag) {
                if (execv(full_exec_path, arg_list) == -1)
                    err(EXIT_FAILURE, "execv");
            }

        } else { // parent

            // Wait for child
            if (wait(&status) != pid)
                err(EXIT_FAILURE, "wait");
        }
    }
}

void kill_child(int i) {
    kill(pid, SIGKILL);
}

void sig_int_handler(int a) {
    puts("User interrupted");
    exit(EXIT_FAILURE);
}

void builtin_exit(char *cmd) {
    puts("User interrupted");
    exit(EXIT_SUCCESS);
}

int builtin_cd(char *cmd) {

    int err;

    // If just input cd
    if (strcmp(cmd, "cd") == 0) {
        if ((err = chdir(home_path)) < 0)
            perror("chdir");

        return err;
    }
    char *dir = strstr(cmd, "cd") + 3;
    // stacat(parent_dir, dir);

    if ((err = chdir(dir)) < 0)

        // If error occurred, no need to exit, just promot
        //err(EXIT_FAILURE, "chdir");
        perror("chdir");

    return err;
}

int set_env(FILE *config_file) {
    char buf[1024];

    fread(buf, 1024, 1, config_file);

    // Find key word PAHT
    char *tmp;
    tmp = strstr(strstr(buf, "PATH"), "=");

    strcpy(new_path_env, tmp);
}