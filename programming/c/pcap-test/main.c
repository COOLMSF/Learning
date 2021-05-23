#include <stdio.h>
#include <pcap.h>
#include <getopt.h>
#include <string.h>
#include <stdlib.h>

void callback(u_char *user, const struct pcap_pkthdr *h, const u_char *bytes)
{
	printf("%d\n", *(int *)user);
}

int main(int argc, char *argv[])
{
	int iflag = 0;
	char *ivalue = NULL;
	int c;

	if (argc == 1) {
		exit(-1);
	}

	while ((c = getopt(argc, argv, "i:")) != -1) {
		switch (c) {
		case 'i':
			iflag = 1;
			ivalue = optarg;
			break;
		case '?':
			if (optopt == 'i') {
				fprintf(stderr, "Option -%c require an argument", optopt);
				exit(-1);
			}
			else {
				fprintf(stderr, "Unknown option -%c", optopt);
				exit(-1);
			}
			break;
		default:
			break;
		}
	}

	char *dev;
	char *net;
	char *mask;
	char errbuf[PCAP_ERRBUF_SIZE];
	int found_dev = 0;
	pcap_t *handler;
	pcap_if_t *interfaces, *p;

	pcap_findalldevs(&interfaces, errbuf);
	p = interfaces;
	while (p) {
		// device exist
		if (strcmp(ivalue, p->name) == 0) {
			found_dev = 1;
			break;
		}
		// printf("Name: %s\n", p->name);
		p = p->next;
	}

	if (!found_dev) {
		fprintf(stderr, "Device %s not found\n", ivalue);
		exit(-1);
	}

	handler = pcap_open_live(ivalue, BUFSIZ, 1, 10000, errbuf);
	if (!handler) {
		perror("pcap_open_live");
		exit(-1);
	}

	int port = 80;
	u_char* argsp = (u_char*) &port;

	pcap_loop(handler, -1, callback, argsp);
}
