//=============================================================================
/**
* The sample of semaphore & shared memory
* The UNIX system programming course
* Copyright © 2002-2003 Valery Yegorov
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/sem.h>
#include <stdio.h>
#include <sys/shm.h>

//=============================================================================
typedef unsigned char bool;
#define true  1
#define false 0
#define MEMORY_SIZE 100

// The critical section based on semaphore

//=============================================================================
/**
* Initialization critical section
* @param key - key for handle
* @param bCreate - creation flag
* @return Handle of semaphore
*/
int InitCS(key_t key, bool bCreate)
{
	if (bCreate)
		return semget(key, 1, 0666 | IPC_CREAT | IPC_EXCL);
	else
		return semget(key, 0, 0);
}

//=============================================================================
/**
* Enter critical section
* @param hsem - handle of semaphore
* @return Operation result
*/
bool EnterCS(int hsem)
{
	struct sembuf sem_lock[2] = { {0,0,0}, {0,1,SEM_UNDO} };
	return !semop(hsem, sem_lock, 2);
}

//=============================================================================
/**
* Leave critical section
* @param hsem - handle of semaphore
* @return Operation result
*/
bool LeaveCS(int hsem)
{
	struct sembuf sem_unlock[1] = { {0,-1,0} };
	return !semop(hsem, sem_unlock, 1);
}

//=============================================================================
/**
* Destroy critical section
* @param hsem - handle of semaphore
* @return Operation result
*/
bool DestroyCS(int hsem)
{
	return !semctl(hsem, 0, IPC_RMID);
}

//=============================================================================
main()
{
	key_t key;
	int   hsem, hmem;
	bool  bWork;
	int   Command;
	char  *pMemory;
	char  szString[MEMORY_SIZE-1];

	// Get a key on execution file
	key = ftok("a.out", 1);
	if (key == -1)
		return 1;

	// Create critical section
	hsem = InitCS(key, true);
	if (hsem == -1)
	{
		// Second process - CS already created
		printf("Slave\n");

		// Open critical section
		hsem = InitCS(key, false);
		if (hsem == -1)
			return 1;

		// Open shared memory
		hmem = shmget(key, MEMORY_SIZE, 0);
		if (hmem == -1)
			return 1;

		// Get pointer of memory
		pMemory = shmat(hmem, 0, 0);
		// Increment processes count
		*pMemory += 1;
	} else
	{
		// First process
		printf("Creator\n");

		// Create shared memory
		hmem = shmget(key, MEMORY_SIZE, 0666 | IPC_CREAT);
		if (hmem == -1)
		{
			DestroyCS(hsem);
			return 1;
		}

		// Get pointer of memory
		pMemory = shmat(hmem, 0, 0);
		// Count of processes is 1
		*pMemory = 1;
		// Zero length string
		*(pMemory + 1) = 0;
	}

	bWork = true;
	while (bWork)
	{
		printf("\nEnter command>");
		scanf("%d", &Command);
		switch (Command)
		{
		case 0: //exit
			bWork = false;
			break;

		case 1: // Print word from memory
			if (EnterCS(hsem))
			{
				printf("%s\n", pMemory + 1);
				LeaveCS(hsem);
			} else
				printf("Oops!\n");
			break;

		case 2: // Set word to memory
			printf("Enter word:");
			scanf("%s", szString);
			if (EnterCS(hsem))
			{
				strncpy(pMemory + 1, szString, MEMORY_SIZE-1);
				LeaveCS(hsem);
			} else
				printf("Oops!\n");
			break;

		case 3: // Get processes count
			if (EnterCS(hsem))
			{
				printf("Count processes: %d\n", *pMemory);
				LeaveCS(hsem);
			} else
				printf("Oops!\n");
			break;

		default:
			printf("Unknown command\n");
			break;
		}
	}

	EnterCS(hsem);
	if (*pMemory == 1)
	{
		// Last process
		shmdt(pMemory);
		// Destroy shared memory
		shmctl(hmem, IPC_RMID, 0);
		// Destroy critical section
		DestroyCS(hsem);
	} else
	{
		// Decrement process count
		*pMemory -= 1;
		shmdt(pMemory);
		LeaveCS(hsem);
	}

	return 0;
}
