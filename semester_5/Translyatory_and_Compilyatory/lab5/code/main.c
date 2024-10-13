#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_RULES 100

int Rules[MAX_RULES];

char* SymbolS(char* szInput);
char* SymbolA(char* szInput);
char* SymbolB(char* szInput);
char* SymbolC(char* szInput);

void AddRuleToOutput(int nRule) {
    static int i = 0;
    if (i == MAX_RULES) {
        printf("Input chain is too long\n");
        exit(0);
    }
    Rules[i++] = nRule;
}

int main() {
    char szInput[256];
    char* szOutput;
    int i = 0;

    memset(Rules, 0, MAX_RULES * sizeof(int));

    printf("Enter chain> ");
    scanf("%s", szInput);

    szOutput = SymbolS(szInput);
    if (!szOutput) {
        printf("Parse error\n");
        return 1;
    }

    if (*szOutput) {
        printf("Unexpected symbol %c\n", *szOutput);
        return 2;
    }

    printf("Output tree for chain: ");
    while (Rules[i]) {
        printf("%d ", Rules[i++]);
    }
    printf("\n");

    return 0;
}

char* SymbolS(char* szInput) {
    // S -> aB | dC | b
    switch (*szInput) {
    case '\0':
        return szInput;
    case 'a':
        AddRuleToOutput(1); // S -> aB
        return SymbolB(szInput + 1);
    case 'd':
        AddRuleToOutput(2); // S -> dC
        return SymbolC(szInput + 1);
    case 'b':
        AddRuleToOutput(3); // S -> b
        return szInput + 1;
    default:
        return NULL;
    }
}

char* SymbolA(char* szInput) {
    // A -> aC | bB | dC
    switch (*szInput) {
    case '\0':
        return szInput;
    case 'a':
        AddRuleToOutput(4); // A -> aC
        return SymbolC(szInput + 1);
    case 'b':
        AddRuleToOutput(5); // A -> bB
        return SymbolB(szInput + 1);
    case 'd':
        AddRuleToOutput(6); // A -> dC
        return SymbolC(szInput + 1);
    default:
        return NULL;
    }
}

char* SymbolB(char* szInput) {
    // B -> aC | dC | a
    switch (*szInput) {
    case '\0':
        return szInput;
    case 'a':
        if (*(szInput + 1) == 'a' || *(szInput + 1) == 'b' || *(szInput + 1) == 'd') {
            AddRuleToOutput(7); // B -> aC
            return SymbolC(szInput + 1);
        }
        else {
            AddRuleToOutput(9); // B -> a (final)
            return szInput + 1;
        }
    case 'd':
        AddRuleToOutput(8); // B -> dC
        return SymbolC(szInput + 1);
    default:
        return NULL;
    }
}

char* SymbolC(char* szInput) {
    // C -> b | aA | d
    switch (*szInput) {
    case '\0':
        return szInput;
    case 'b':
        AddRuleToOutput(10); // C -> b
        return szInput + 1;
    case 'a':
        AddRuleToOutput(11); // C -> aA
        return SymbolA(szInput + 1);
    case 'd':
        AddRuleToOutput(12); // C -> d
        return szInput + 1;
    default:
        return NULL;
    }
}
