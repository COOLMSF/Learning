/* Main function begins here */

/*
 * The original project is here:
 * https://github.com/souravaich/shell.git
 *
 * This program is modified by coolder, I was just read the source code,
 * and add some features.
 *
 */

#include "allheaders.h"
#include "shell.h"

int main() {

    int status;
    system ("clear");
    signal(SIGINT, sigintHandler);
    char new_line = 0;
    using_history();

    do {

        clear_variables();
        shell_prompt();
        input_buffer = readline (prompt);

        if(strcmp(input_buffer,"\n"))
            add_history (input_buffer);

        if (!(strcmp(input_buffer, "\n") && strcmp(input_buffer,"")))
            continue;

        if (!(strncmp(input_buffer, "exit", 4) && strncmp(input_buffer, "quit", 4))) {

            flag = 1;
            break;
        }

        tokenize_by_pipe();

        if (bckgrnd_flag == 0)
            waitpid(pid,&status,0);
        else
            status = 0;

    } while(!WIFEXITED(status) || !WIFSIGNALED(status));

    if (flag == 1) {

        printf("\nThank You... Closing Shell...\n");
        exit(0);
    }

    return 0;
}