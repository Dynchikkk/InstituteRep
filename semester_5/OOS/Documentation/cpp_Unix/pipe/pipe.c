//=============================================================================
/**
* The sample of pipe transfer
* The UNIX system programming course
* Copyright © 2002-2003 Valery Yegorov
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
#include <stdio.h>
#include <unistd.h>

//=============================================================================
int main(void)
{   
	int status;
	int f[2];
	char Size;
	char Buffer[255];
	int res;

	// Create pipe
	if (pipe(f))
	{
		printf("Error create pipe\n");
		return 1;
	}

	if(0 == fork())
	{
		// Child will print a words
		while(1)
		{
			// Read size from pipe
			if ((res = read(f[0], &Size, 1)) == 1)
			{
				if (Size == 0)
					break;
				// Read word from pipe
				read(f[0], Buffer, Size);
				Buffer[Size] = 0;
				printf("%s\n", Buffer);
			}
		}

		printf("Child exit\n");

	} else
	{
		// Parent will scan words from terminal
		while(1)
		{	
			scanf("%s", Buffer);
			if (!strcmp(Buffer, "exit"))
			{
				break;
			}
			Size = strlen(Buffer);
			// Write size
			write(f[1], &Size, 1);
			// Write word
			write(f[1], Buffer, Size);
		}

		// Send exit command
		Size = 0;
		write(f[1], &Size, 1);

		// Wait child
		wait(&status);
		printf("Parent exit\n");
	}

	// Close pipe
	close(f[0]);
	close(f[1]);
	return 0;
}
