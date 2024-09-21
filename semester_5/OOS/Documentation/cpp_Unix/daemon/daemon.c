//=============================================================================
/**
* The sample of daemon
* The UNIX system programming course
* Copyright © 2002-2003 Valery Yegorov
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
#include <syslog.h>
#include <signal.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <unistd.h>

//=============================================================================
main(int argc, char **argv)
{
	int nHandle;
	struct rlimit flim;

	// If parent is not "init"
	if (getppid() != 1)
	{
		// Close terminal signals
		signal(SIGTTOU, SIG_IGN);
		signal(SIGTTIN, SIG_IGN);
		signal(SIGTSTP, SIG_IGN);

		// Release a parent process
		if (fork() != 0)
			exit(0);

		// Create new session
		setsid();
	}

	// Close file handles
	getrlimit(RLIMIT_NOFILE, &flim);
	for (nHandle = 0; nHandle < flim.rlim_max; nHandle++)
		close(nHandle);

	// Change current directory to root
	chdir("/");

	// Log
	openlog("Test daemon", LOG_PID | LOG_CONS, LOG_DAEMON);
	syslog(LOG_INFO, "Daemon started");
	closelog();

	while(1)
	{
		sleep(1);
	}
}