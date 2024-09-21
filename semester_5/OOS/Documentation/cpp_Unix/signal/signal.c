//=============================================================================
/**
* The sample of simple signal handler
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
	// Set handler occuring once on a SIGINT signal
	signal(SIGINT, sig_handler);
	printf("SIGINT received\n");
}

//=============================================================================
main()
{
	// Set handler occuring once on a SIGINT signal
	signal(SIGINT, sig_handler);

	signal(SIGUSR1, SIG_DFL);
	signal(SIGUSR2, SIG_IGN);

	while(1)
		pause();

}