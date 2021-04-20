#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include "transfer.h"

void writefile(int sockfd, FILE *fp);
void ask_passwd(int connfd, FILE *fp);

ssize_t total=0;
int password_valid = 0;
int main(int argc, char *argv[])
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd == -1)
    {
        perror("Can't allocate sockfd");
        exit(1);
    }

    /*
     * Username and password for authentication,
     * passwd_file contains username and passwd.
     */
    char *passwd_file = "./passwd";

    FILE *fp = fopen(passwd_file, "r");
    if (fp == NULL) {
    	/*
    	 * Password file not found,
    	 * deny to login
    	 */
		perror("fopen");
		exit(-1);
    }

    struct sockaddr_in clientaddr, serveraddr;
    memset(&serveraddr, 0, sizeof(serveraddr));
    serveraddr.sin_family = AF_INET;
    serveraddr.sin_addr.s_addr = htonl(INADDR_ANY);
    serveraddr.sin_port = htons(SERVERPORT);

    if (bind(sockfd, (const struct sockaddr *) &serveraddr, sizeof(serveraddr)) == -1)
    {
        perror("Bind Error");
        exit(1);
    }

    if (listen(sockfd, LINSTENPORT) == -1)
    {
        perror("Listen Error");
        exit(1);
    }

	socklen_t addrlen = sizeof(clientaddr);

	while (1) {
		int connfd = accept(sockfd, (struct sockaddr*)&clientaddr, &addrlen);
		if (connfd==-1) {
			perror("Connect Error");
			close(connfd);
			break;
			// exit(1);
		}
		close(sockfd);

		/*
		 * Ask for username and password
		 */
		ask_passwd(connfd, fp);

		/*
		 * Authentication OK, start to receive file
		 */
		if (password_valid) {
			char filename[BUFFSIZE] = { 0 };
			if (recv(connfd, filename, BUFFSIZE, 0)==-1) {
				perror("Can't receive filename");
				close(connfd);
				break;
				// exit(1);
			}

			fp = fopen(filename, "wb");
			if (fp==NULL) {
				perror("Can't open file");
				exit(1);
			}

			char addr[INET_ADDRSTRLEN];
			printf("Start receive file: %s from %s\n", filename,
					inet_ntop(AF_INET, &clientaddr.sin_addr, addr, INET_ADDRSTRLEN));
			writefile(connfd, fp);
			printf("Receive Success, NumBytes = %ld\n", total);

			fclose(fp);
			close(connfd);
		}
	}
}

void writefile(int sockfd, FILE *fp)
{
    ssize_t n;
    char buff[MAX_LINE] = {0};
    while ((n = recv(sockfd, buff, MAX_LINE, 0)) > 0)
    {
	    total+=n;
        if (n == -1)
        {
            perror("Receive File Error");
            exit(1);
        }

        if (fwrite(buff, sizeof(char), n, fp) != n)
        {
            perror("Write File Error");
            exit(1);
        }
        memset(buff, 0, MAX_LINE);
    }
}

void ask_passwd(int connfd, FILE *fp)
{
	char *msg_username = "Username:";
	char *msg_passwd = "Passwd:";
	char username_client[MAX_LINE] = { 0 }, passwd_client[MAX_LINE] = { 0 };
	char username_server[MAX_LINE] = { 0 }, passwd_server[MAX_LINE] = { 0 };
	ssize_t ret;


	/*
	 * Send username message to client
	 */
	ret = send(connfd, msg_username, strlen(msg_username), 0);
	if (ret == -1) {
		perror("send msg_username");
		exit(-1);
	}

	/*
	 * Wait username from client
	 */
	ret = recv(connfd, username_client, MAX_LINE, 0);
	if (ret == -1) {
		perror("recv msg_username");
		exit(-1);
	}

	/*
	 * Send password message to client
	 */
	ret = send(connfd, msg_passwd, strlen(msg_passwd), 0);
	if (ret == -1) {
		perror("send msg_passwd");
		exit(-1);
	}

	/*
	 * Wait password from client
	 */
	ret = recv(connfd, passwd_client, MAX_LINE, 0);
	if (ret == -1) {
		perror("recv msg_passwd");
		exit(-1);
	}

	/*
	 * Check if username and password are valid
	 */
	char *line = NULL;
	size_t len;
	while (getline(&line, &len, fp) != -1) {
		ret = sscanf(line, "%s %s", username_server, passwd_server);
		if (ret != 2) {
			printf("bad password file format");
			exit(-1);
		}

		if ((strcmp(username_client, username_server) == 0) && (strcmp(passwd_client,
				passwd_server) == 0)) {
			password_valid = 1;
			break;
		}
	}

	if (!password_valid) {
		printf("Invalid password\n");
		// exit(-1);
	}
}