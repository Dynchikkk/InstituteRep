//=============================================================================
/**
* The sample of message transfer
* The UNIX system programming course
* Copyright © 2002-2003 Valery Yegorov
* The State University of Penza, Russia
* Author Email: vec@alice.stup.ac.ru
*/

//=============================================================================
#define MSG_SIZE 80
#define PERM 0666
#define MSG_TYPE 1

//=============================================================================
// Struct for message
typedef struct {
    long mtype;
    char buffer[MSG_SIZE];
} SMSG;
