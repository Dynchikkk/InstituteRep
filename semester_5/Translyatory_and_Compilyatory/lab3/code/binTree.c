#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include "binTree.h"

Tree* CreateNode(char value[SIZE])
{
	Tree* tmp = (Tree*)malloc(sizeof(Tree));
	if (tmp == NULL) {
		printf("ERROR: can't allocate memory\n");
		return NULL;
	}
	strcpy(tmp->value, value);
	tmp->left = NULL;
	tmp->right = NULL;
	return tmp;
}

Tree* CreateTree(char* value)
{
	return CreateNode(value);
}

Tree* AddNode(char* value, Tree* root)
{
	if (root != NULL && strcmp(root->value, value) == 0) {
		printf("ERROR: same value in tree\n");
		return root;
	}

	if (root == NULL) {
		root = CreateNode(value);
	}
	else if (strcmp(value, root->value) < 0) {
		root->left = AddNode(value, root->left);
	}
	else {
		root->right = AddNode(value, root->right);
	}
	return(root);
}

Tree* SearchNode(char* value, Tree* root)
{
	if (root == NULL) {
		return NULL;
	}

	if (strcmp(root->value, value) == 0) {
		return root;
	}

	if (strcmp(value, root->value) < 0) {
		return SearchNode(value, root->left);
	}
	else {
		return SearchNode(value, root->right);
	}
}

int EntryCount(char* value, Tree* root, int entry)
{
	if (root == NULL) {
		return -1;
	}

	if (strcmp(root->value, value) == 0) {
		return entry + 1;
	}

	if (strcmp(value, root->value) < 0) {
		return EntryCount(value, root->left, entry + 1);
	}
	else {
		return EntryCount(value, root->right, entry + 1);
	}
}

void ClearTree(Tree* root)
{
	if (root == NULL) {
		return;
	}
	ClearTree(root->left);
	ClearTree(root->right);
	free(root);
}

void TreePrint(Tree* root, int tabs)
{
	for (int i = 0; i < tabs * 2; i++) {
		printf(" ");
	}

	if (root == NULL) {
		printf("-\n");
		return;
	}

	printf("%s\n", root->value);

	TreePrint(root->left, tabs + 1);
	TreePrint(root->right, tabs + 1);
}

void PrintOneNode(Tree* node)
{
	if (node == NULL) {
		printf("No node\n");
		return;
	}

	printf("%s\n", node->value);
	if (node->left != NULL) {
		printf("%s", node->left->value);
	}
	printf("  ");
	if (node->right != NULL) {
		printf("%s", node->right->value);
	}
	printf("\n");
}

void TreeWalk(Tree* root)
{
	if (root == NULL) {
		return;
	}

	printf("%s ", root->value);
	TreeWalk(root->left);
	TreeWalk(root->right);
}
