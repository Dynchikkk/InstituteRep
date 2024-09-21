//=============================================================================
/**
* The sample of message transfer
* The UNIX system programming course
* Copyright © 2002-2003 Valery Yegorov
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <stdio.h>
#include "msg.h"

//=============================================================================
main()
{
	key_t kmsg;
	int   hmsg, res, size;
	SMSG msg;

	// Get message key
	kmsg = ftok("msgsrv", 1);
	if (kmsg == -1)
		return 1;

	// Open message handle
	hmsg = msgget(kmsg, 0);
	if (hmsg == -1)
		return 1;

	msg.mtype = MSG_TYPE;

	while(1)
	{
		// Scan for word from terminal
		scanf("%s", msg.buffer);

		// Check for client exit
		if (strcmp(msg.buffer, "exit") == 0)
			break;

		// Check for server exit
		if (strcmp(msg.buffer, "stop") == 0)
			size = 0;
		else
			size = strlen(msg.buffer) + 1;

		// Send message
		res = msgsnd(hmsg, &msg, size, 0);
		if (res == -1)
			break;
	}

	return 0;
}


