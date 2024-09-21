//=============================================================================
/**
* Пример межпроцессного взаимодействия с использованием именованных каналов
* Курс "Системное программное обеспечение"
*
* The sample of process intercommunication by the named pipe
* The Windows Win32 system programming course
* Copyright © 2002-2003 Valery Yegorov
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
/** Size of buffer */
const DWORD dwBUFSIZE = 255;
/** Timeout of pipe waiting */
const DWORD dwPIPE_TIMEOUT = 20000;
/** Pipe name */
const char *szPIPE_NAME = "\\\\.\\pipe\\spopipe";