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

// Default configure file name
#define CONF_FILE "~/.MyShell.conf"

// Read environment variable from file
int set_env(FILE *);
void sig_int_handler(int);
void kill_child(pid_t child_pid);

/*
 * Some builtin commands
 */

int is_builtin_cmd(char *cmd);

// builtin_cd find directory name in cmd and change to it
int builtin_cd(char *cmd);

// builtin exit to exits shell
void builtin_exit(char *cmd);

// CTL^L signal handler to clear, no need to implement, built in readline();
void clean_handler(int);