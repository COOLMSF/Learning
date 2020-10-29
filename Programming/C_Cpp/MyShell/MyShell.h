//
// Created by coolder on 10/28/20.
//

#ifndef MYSHELL_MYSHELL_H
#define MYSHELL_MYSHELL_H

#endif //MYSHELL_MYSHELL_H

// Max length of command that input
#define MAX_CMD_LEN 255

// Max arguments that shell support
#define MAX_ARGS 20

// Max length of each argument
#define MAX_ARG_LEN 10

// Max path length
#define MAX_PAHT_LEN 255


// Read environment variable from file
int read_env(void);
void sig_int_handler(int);

/*
 * Some builtin commands
 */

int is_builtin_cmd(char *cmd);

// builtin_cd find directory name in cmd and change to it
void builtin_cd(char *cmd);

// builtin exit to exits shell
void builtin_exit(char *cmd);