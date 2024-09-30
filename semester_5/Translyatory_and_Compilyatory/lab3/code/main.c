#include <stdio.h>
#include "binTree.h"

int main()
{
	Tree* root = CreateTree("a50");

	printf("---- Tree print ----\n");
	root = AddNode("a10", root);
	root = AddNode("a12", root);
	root = AddNode("a11", root);
	root = AddNode("a20", root);
	root = AddNode("a19", root);
	root = AddNode("a25", root);
	root = AddNode("a24", root);
	root = AddNode("a100", root);
	root = AddNode("a60", root);
	root = AddNode("a110", root);
	TreePrint(root, 0);

	printf("---- Finded node ----\n");
	Tree* find = SearchNode("a11", root);
	PrintOneNode(find);

	printf("---- Entry count ----\n");
	printf("Entry count of %s: %d\n", "a19", EntryCount("a19", root, 0));

	ClearTree(root);

	return 0;
}
