//
// Created by coolder on 11/17/20.
//

#include "allheaders.h"
#include "shell.h"

/* This function is used to execute the inbuild commands. It also calls
   the "execute_command" function when the command to be executed doesn't
   fall under inbuild commands */

int execute_inbuild_commands (char *cmd_exec, int input, int isfirst, int islast) {

    char *new_cmd_exec;

    new_cmd_exec = strdup(cmd_exec);

    tokenize_by_space (cmd_exec);
    check_for_bckgrnd ();

    if (args[0] != NULL) {
        if (!(strcmp(args[0], "exit") && strcmp(args[0], "quit")))
            exit(0);

        if (strcmp(args[0], "echo")) {

            cmd_exec = skip_double_quote(new_cmd_exec);
            tokenize_by_space(cmd_exec);
        }

        if (!strcmp("cd", args[0])) {

            change_directory();
            return 1;
        }

        if (!strcmp(args[0], "history")) {

            print_history_list();
            return 1;
        }
    }
    return (execute_command(input, isfirst, islast, new_cmd_exec));
}