//=============================================================================
/**
* Пример работы почтового ящика
* Курс "Системное программное обеспечение"
*
* The sample of mailslot working
* The Windows Win32 system programming course
* Copyright © 2002-2003 Valery Yegorov
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
#include <windows.h>
#include <stdio.h>

//=============================================================================
const DWORD MAIL_SIZE = 100;

//=============================================================================
int main(int argc, char* argv[])
{
	HANDLE hMail;
	char   *szMailslotName = "\\\\.\\mailslot\\SPOMailslot";
	char   Buffer[MAIL_SIZE];
	DWORD  dwCountBytes;
	DWORD  dwNextSize;

	// Create a mailslot
	// It's recommended to set last argument to NULL
	// In some versions of Windows MAILSLOT_WAIT_FOREVER is not working
	hMail = CreateMailslot(szMailslotName, MAIL_SIZE, 0, NULL);
	if (hMail == INVALID_HANDLE_VALUE)
	{
		printf("This process is Client\n");
		// Open a mailslot as a file
		hMail = CreateFile(szMailslotName, 
			GENERIC_WRITE, 
			FILE_SHARE_READ | // required to write to a mailslot 
				FILE_SHARE_WRITE, // for a multiple instances of client 
			NULL,
			OPEN_EXISTING, 
			FILE_ATTRIBUTE_NORMAL, 
			NULL); 
		if (hMail == INVALID_HANDLE_VALUE) 
		{
			printf("Error at mailslot open\n");
			return 1;
		}

		printf ("Enter a word (\"exit\" will also stop the server):");
		scanf("%s", Buffer);
		// Word will send to server
		WriteFile(hMail, Buffer, strlen(Buffer)+1, &dwCountBytes, 0);

	} else
	{ 
		printf("This process is Server\n");

		while(1)
		{
			// Getting size of next message
			if (!GetMailslotInfo(hMail, NULL, &dwNextSize, NULL, NULL))
			{
				CloseHandle(hMail);
				printf("Error while get mailslot info\n");
				return 1;
			}

			// In some versions of Windows higher bits 
			// has meaningless data - error of Microsoft
			if ((dwNextSize | 0xffff0000) != MAILSLOT_NO_MESSAGE)
			{
				// Read data from client
				if (!ReadFile(hMail, Buffer, (WORD)dwNextSize, &dwCountBytes, 0))
				{
					printf("Error while read mailslot\n");
					CloseHandle(hMail);
					return 1;
				}
				printf("The word was received from client: %s\n", Buffer);

				// if buffer contain the word "exit" then break from the loop
				if (strcmp(Buffer, "exit") == 0)
					break;
			} else
				Sleep(20);

		}
	}

	printf("Bye!\n");
	CloseHandle(hMail);
	return 0;
}
