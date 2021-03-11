//
// Created by coolder on 10/28/20.
//

#ifndef MYSHELL_MYSHELL_H
#define MYSHELL_MYSHELL_H

#endif //MYSHELL_MYSHELL_H

#define MAX_CMD_LEN 255
#define MAX_ARGS 20
#define MAX_ARG_LEN 10
#define MAX_PAHT_LEN 255

#define CONF_FILE "~/.MyShell.conf"

char *arg_lists[MAX_ARGS];

int read_cfg_from_file(FILE *);
void sig_int_handler(int);
void kill_child(pid_t child_pid);

// Built in cmd
int is_builtin_cmd(char *cmd);
int builtin_cd(char *cmd);
void builtin_exit(char *cmd);