#include "allheaders.h"

#define IP "127.0.0.1"
#define PORT 3333
#define BUFSZ 1024

#define FIRST_RECV_BUF_SIG "send file please"

int main()
{
	int sockfd;
	struct sockaddr_in sa_in;

	char first_send_buf[BUFSZ] = { "I want send file" };
	char first_recv_buf[BUFSZ] = { 0 };
	char second_send_buf[BUFSZ] = { "I will send file" };

	sockfd = socket(AF_INET, SOCK_STREAM, 0);
	if (sockfd == -1) {
		perror("socket");
		exit(EXIT_FAILURE);
	}

	sa_in.sin_family = AF_INET;
	sa_in.sin_port = htons(PORT);

	if (inet_pton(AF_INET, IP, &sa_in.sin_addr) == -1) {
		perror("inet_pton");
		exit(EXIT_FAILURE);
	}

	if (connect(sockfd, &sa_in, sizeof(struct sockaddr_in)) == -1) {
		perror("connect");
		exit(EXIT_FAILURE);
	}

	if (send(sockfd, first_send_buf, BUFSZ, 0) == -1) {
		perror("send, first send buf");
		exit(EXIT_FAILURE);
	}

	if (recv(sockfd, first_recv_buf, BUFSZ, 0) == -1) {
		perror("recv, firtst recv buf");
		exit(EXIT_FAILURE);
	}

	if (strstr(first_recv_buf, FIRST_RECV_BUF_SIG) == NULL) {
		fprintf(stderr, "protol error, FIRST_RECV_BUF_SIG not found");
		exit(EXIT_FAILURE);
	}

	if (send(sockfd, second_send_buf, BUFSZ, 0) == -1) {
		perror("send, second send buf");
		exit(EXIT_FAILURE);
	}

	printf("connect established");
}

