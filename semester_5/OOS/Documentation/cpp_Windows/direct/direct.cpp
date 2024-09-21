//=============================================================================
/**
* Пример прямого чтения из памяти другого процесса этой же программы
* Курс "Системное программное обеспечение"
*
* The sample of direct memory reading from the other process of this program
* The Windows Win32 system programming course
* Copyright © 2002-2003 Valery Yegorov
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
#include <windows.h> 
#include <stdio.h> 

//=============================================================================
// The "shared" buffer containing the string 
const int BUFFER_SIZE = 255;
char szBuffer[BUFFER_SIZE];

//=============================================================================
int main(int argc, char* argv[])
{
	enum 
	{
		exit = 0,
		print_this = 1,
		fill = 2,
		print_other = 3
	} eCommand;
	DWORD dwOtherPID;
	HANDLE hProcess;
	DWORD dwBytesRead;
	char szOtherBuffer[BUFFER_SIZE];

	szBuffer[0] = 0;
	printf("This process id: %d\n", GetCurrentProcessId());
	printf("Commands:\n");
	printf("	0-exit\n");
	printf("	1-print the contents of buffer\n");
	printf("	2-put the word to buffer\n");
	printf("	3-print the contents of other process buffer\n");

	do {
		printf("Enter a command:");
		scanf("%d", &eCommand);
		switch (eCommand)
		{
			case exit:
				break;
			case print_this:
				// Print the buffer contents
				printf("My Buffer: %s\n", szBuffer);
				break;
			case fill:
				// Put one word to the buffer
				printf("Enter a word to fill my buffer:");
				scanf("%s", szBuffer);
				break;
			case print_other:
				// Print the contents of other process buffer
				printf("Enter PID of other process:");
				scanf("%d", &dwOtherPID);
				// Open other process by the PID
				hProcess = OpenProcess(PROCESS_ALL_ACCESS, 0, dwOtherPID);
				if (hProcess == NULL)
				{
					printf("Cannot open process\n");
					break;
				}
				szOtherBuffer[0] = 0;
				// Read the other process memory
				if (
					!ReadProcessMemory(hProcess, szBuffer, 
									   szOtherBuffer, BUFFER_SIZE, &dwBytesRead) ||
					dwBytesRead != BUFFER_SIZE
				   )
				{
					printf("Cannot read process memory\n");
					break;
				}
				szOtherBuffer[BUFFER_SIZE - 1] = 0;
				// Print the content of other process buffer
				printf("Buffer of process %d: %s\n", dwOtherPID, szOtherBuffer);
				CloseHandle(hProcess);
				hProcess = 0;
				break;
		}
	}	while (eCommand != exit);

	printf("Bye!\n");
	return 0;
}
