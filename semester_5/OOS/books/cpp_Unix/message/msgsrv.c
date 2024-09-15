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
	int   hmsg, size;
	SMSG msg;

	// Get message key
	kmsg = ftok("msgsrv", 1);
	if (kmsg == -1)
		return 1;

	// Create message object & open message handle
	hmsg = msgget(kmsg, PERM | IPC_CREAT);
	if (hmsg == -1)
		return 1;

	while(1)
	{
		// Read word from a message
		size = msgrcv(hmsg, &msg, MSG_SIZE, MSG_TYPE, 0);

		// If message size is zero length then it's mean exit
		if ((size == 0) || (size == -1))
			break;

		// Print a word
		printf("%s\n", msg.buffer);
	}

	// Destroy message object
	msgctl(hmsg, IPC_RMID, 0);
	return 0;
}


