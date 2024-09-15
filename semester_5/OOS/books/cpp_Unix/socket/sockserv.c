//=============================================================================
/**
* The sample of data transfer by BSD socket
* Server
* The UNIX system programming course
* Copyright © 2002-2003 Valery Yegorov
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <stdio.h>
#include <unistd.h>
#include <signal.h>

//=============================================================================
#define SOCK_NAME "/home/vec/cpp/sock"
int hSocket, hNewSocket;

//=============================================================================
static void sighndlr(int signo)
{
	close(hSocket);
	close(hNewSocket);
	unlink(SOCK_NAME);
	exit(0);
}

//=============================================================================
main()
{
	struct sockaddr_un address;
	char cSize;
	char szBuffer[255];

	// Release parent process
	if (fork() != 0)
		return 0;

	// Set handler on termination signal
	signal(SIGTERM, sighndlr);

	// Open socket
	hSocket = socket(PF_UNIX, SOCK_STREAM, 0);
	if (hSocket == -1)
		return 1;

	address.sun_family = AF_UNIX;
	strcpy(address.sun_path, SOCK_NAME);

	// Bind address
	if (bind(hSocket, &address, sizeof(address)) == -1)
	{
		close(hSocket);
		return -1;
	}

	// Listen up to 10 clients
	if (listen(hSocket, 10) == -1)
	{
		close(hSocket);
		return 1;
	}

	while(1)
	{
		// Accept connection
		hNewSocket = accept(hSocket, 0, 0);
		if (hNewSocket == -1)
		{
			close(hSocket);
			return 1;
		}

		if (0 != fork()) // parent exit, child stay server
		{
			close(hSocket);
			// Read data from socket
			read(hNewSocket, &cSize, 1);
			read(hNewSocket, szBuffer, cSize);
			printf("\n%s\n", szBuffer);
			close(hNewSocket);
			return 0;
		} else
			close(hNewSocket);
	}
}
