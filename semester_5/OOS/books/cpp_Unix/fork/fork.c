//=============================================================================
/**
* The sample of process creation
* The UNIX system programming course
* Copyright © 2002-2003 Valery Yegorov
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>


//=============================================================================
int main(void)
{   
    int nStatus;

    printf("Program started\n");
    
    if( fork() == 0)
    {
		printf("Child process\n");
		execlp("ls", "", NULL);
		printf("Error occured\n");
		return 1;
    } else
    {
		printf("Parent process\n");
		wait(&nStatus);
		printf("Child returns %d\n", nStatus);
		return 0;
    }
}