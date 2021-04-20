#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <libgen.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include "transfer.h"

void sendfile(FILE *fp, int sockfd);
void send_passwd(int connfd);
ssize_t total=0;
int main(int argc, char* argv[])
{

    if (argc != 3)
    {
        perror("usage:send_file filepath <IPaddress>");
        exit(1);
    }

    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0)
    {
        perror("Can't allocate sockfd");
        exit(1);
    }

    struct sockaddr_in serveraddr;
    memset(&serveraddr, 0, sizeof(serveraddr));
    serveraddr.sin_family = AF_INET;
    serveraddr.sin_port = htons(SERVERPORT);
    if (inet_pton(AF_INET, argv[2], &serveraddr.sin_addr) < 0)
    {
        perror("IPaddress Convert Error");
        exit(1);
    }

    if (connect(sockfd, (const struct sockaddr *) &serveraddr, sizeof(serveraddr)) < 0)
    {
        perror("Connect Error");
        exit(1);
    }

    /*
     *
     */
    send_passwd(sockfd);

    char *filename = basename(argv[1]);
    if (filename == NULL)
    {
        perror("Can't get filename");
        exit(1);
    }

    char buff[BUFFSIZE] = {0};
    strncpy(buff, filename, strlen(filename));
    if (send(sockfd, buff, BUFFSIZE, 0) == -1)
    {
        perror("Can't send filename");
        fprintf(stderr, "username or password error");
        exit(1);
    }

    FILE *fp = fopen(argv[1], "rb");
    if (fp == NULL)
    {
        perror("Can't open file");
        exit(1);
    }

    sendfile(fp, sockfd);
    //puts("Send Success");
    printf("Send Success, NumBytes = %ld\n", total);
    fclose(fp);
    close(sockfd);
    return 0;
}

void sendfile(FILE *fp, int sockfd)
{
    int n;
    char sendline[MAX_LINE] = {0};
    while ((n = fread(sendline, sizeof(char), MAX_LINE, fp)) > 0)
    {
	    total+=n;
        if (n != MAX_LINE && ferror(fp))
        {
            perror("Read File Error");
            exit(1);
        }

        if (send(sockfd, sendline, n, 0) == -1)
        {
            perror("Can't send file");
            exit(1);
        }
        memset(sendline, 0, MAX_LINE);
    }
}

void send_passwd(int connfd)
{
	ssize_t ret;
	char buf[MAX_LINE];
	char username_client[MAX_LINE] = { 0 },
	passwd_client[MAX_LINE] = { 0 };

	/*
	 * Wait for username message from server
	 */
	ret = recv(connfd, buf, MAX_LINE, 0);
	if (ret == -1) {
		perror("recv msg_username");
		exit(-1);
	}
	puts(buf);
	/*
	 * Get username from local and transfer it to remote
	 */
	scanf("%s", username_client);
	ret = send(connfd, username_client, strlen(username_client), 0);
	if (ret == -1) {
		perror("send username_client");
		exit(-1);
	}


	/*
	 * Wait for password message from server
	 */
	ret = recv(connfd, buf, MAX_LINE, 0);
	if (ret == -1) {
		perror ("recv msg_passwd");
		exit(-1);
	}
	puts("Passwd:");
	/*
	 * Get password from local and transfer it to server
	 */
	scanf("%s", passwd_client);
	ret = send(connfd, passwd_client, strlen(passwd_client), 0);
	if (ret == -1) {
		perror("send passwd_client");
		exit(-1);
	}
}