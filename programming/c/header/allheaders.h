#define _GNU_SOURCE

#include<assert.h>
#include<dirent.h>
#include<errno.h>
#include<libnet.h>
#include<math.h>
#include<memory.h>
#include<netdb.h>
#include<netinet/in.h>
#include<netinet/if_ether.h>
#include<arpa/inet.h>
#include<net/ethernet.h>
#include<netinet/ip_icmp.h>
#include<netinet/udp.h>
#include<netinet/tcp.h>
#include<netinet/ip.h>
#include<pcap.h>
#include<pwd.h>
#include<stdint.h>
#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>
#include<string.h>
#include<sys/ptrace.h>
#include<sys/socket.h>
#include<sys/types.h>
#include<sys/wait.h>
#include<sys/msg.h>
#include<time.h>
#include<unistd.h>
#include <ftw.h>
#include<getopt.h>
#include<pthread.h>
#include<setjmp.h>
#include<termio.h>
#include<error.h>
#include<err.h>
#include<sys/ioctl.h>

#include <curses.h>

// Include book header
#include "../APUE/apue.3e/include/apue.h"
// #include "../UNP/unpv13e/lib/unp.h"
// Conflict with unp.h
#include<readline/readline.h>
#include<readline/history.h>

// Include my error hanlder header file
#include "MyMacro.h"

// #include <glib-2.0/glib.h>
// #include "glib-2.0/glib/glist.h"