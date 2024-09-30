#ifndef BIN_TREE
#define BIN_TREE
#include <string.h>

#define SIZE 256

typedef struct Node {
	char value[SIZE];
	struct Node* left;
	struct Node* right;
} Tree;

Tree* CreateTree(char* value);

Tree* AddNode(char* value, Tree* root);

Tree* SearchNode(char* value, Tree* root);

int EntryCount(char* value, Tree* root, int entry);

void TreePrint(Tree* root, int tabs);

void ClearTree(Tree* root);

void PrintOneNode(Tree* root);

void TreeWalk(Tree* root);

#endif
