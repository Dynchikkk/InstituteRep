//=============================================================================
/**
* The sample of sigaction
* The UNIX system programming course
* Copyright © 2002-2003 Valery Yegorov
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
#include <signal.h>
#include <stdio.h>

//=============================================================================
void sig_handler(int signo)
{
	printf("SIGINT received\n");
}

//=============================================================================
main()
{
	struct sigaction act,oldact;

	act.sa_handler = sig_handler;
	sigemptyset(&act.sa_mask);
	act.sa_flags = 0;

	// Set handler on a SIGINT signal
	if (sigaction(SIGINT, &act, &oldact) < 0)
	{
		printf("Error\n");
	}

	while(1)
		pause();
}