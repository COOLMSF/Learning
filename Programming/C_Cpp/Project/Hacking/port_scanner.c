#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <time.h>
#define MAX 65536

int main(int argc, char ** argv)
{
    time_t begin, end;
    time(&begin);

    printf("Scanning ports 0 - 65535 for IP address : %s\n", argv[1]);

    FILE * file = fopen("./result.txt", "w");//open log file

    for (unsigned short port = 1000; port < 1300; port++)//loop through and scan all ports
    {
        int Connection = socket(AF_INET,SOCK_STREAM, 0);
        struct sockaddr_in temp = { 0 };

        //fill the struct with information on the computer you wish to scan
        temp.sin_addr.s_addr = inet_addr(argv[1]);
        temp.sin_family = AF_INET;
        temp.sin_port = htons(port);

        int error = connect(Connection, (struct sockaddr*)&temp, sizeof temp);
        if(error != -1) 
        {
            //if the port is open then get information about that port and print it to the log file
            char host[128];
            char service[128];
            getnameinfo((struct sockaddr*)&temp, sizeof temp, host, (sizeof host), service, sizeof service, 0);
            printf("Port : %d, Service : %s, Open\n", port, service);
            fprintf(file, "Port : %d, Service : %s, Open\n", port, service);
        }
        close(Connection); //Destroy socket
    }
    fclose(file);//Close the file

    //calculate the time that elapsed since the program was started and rint it
    time(&end);
    double elapsed_secs = difftime(end, begin);
    printf("Elapsed Seconds : %lf", elapsed_secs);
    return 0;
}
