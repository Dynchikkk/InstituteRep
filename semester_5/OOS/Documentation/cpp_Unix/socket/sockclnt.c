//=============================================================================
/**
* The sample of data transfer by BSD socket
* Client
* The UNIX system programming course
* Copyright © 2002-2003 Valery Yegorov
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/un.h>

//=============================================================================
#define SOCK_NAME "/home/spo/sock"

//=============================================================================
main()
{
	int hSocket;
	struct sockaddr_un address;
	char cSize;
	char szBuffer[255];

	// Open socket
	hSocket = socket(PF_UNIX, SOCK_STREAM, 0);
	if (-1 == hSocket)
		return 1;

	// BSD socket
	address.sun_family = AF_UNIX;
	strcpy(address.sun_path, SOCK_NAME);

	// Connect to server
	if (-1 == connect(hSocket, &address, sizeof(address)))
	{
		close(hSocket);
		return -1;
	}

	printf("Enter a word:");
	scanf("%s", szBuffer);
	cSize = strlen(szBuffer) + 1;

	// Send data to server
	write(hSocket, &cSize, 1);
	write(hSocket, szBuffer, cSize);

	close(hSocket);
}
