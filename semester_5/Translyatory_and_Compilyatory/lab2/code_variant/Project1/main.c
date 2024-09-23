#include <stdio.h>
#include <ctype.h>
#include <stdbool.h>

const char* testCases[] = {
		"123;",         
		"+456;",        
		"-789;",        
		"0123;",        
		"0x1a2b;",      
		"-0xff;",       
		"123u;",        
		"0127;",        
		"0xFFUL;",      
		"12llu;",       
		"12ull;",       
		"1ull;",        
		"+0x101luL;",   
		"0x7bH;",       
		"078;",         
		"0;",
		"+0x10x1lL;",
		"+0x101LxL;",
		"+0x101lUL;",
		"+0x101l+L;",
		"+0x101llu2;",
		"+0x101llL;",
		"+0l;",
		"+++----1;",
		"++++___;",
		"-0;",
		"1UU;",
		NULL
};

typedef enum
{
	START,
	SIGN,
	ZERO,
	DEC,
	OCT,
	HEX,
	SUF_U,
	SUF_L,
	SUF_UL,
	SUF_LU,
	SUF_LL,
	SUF_ULL,
	SUF_LLU,
	END, 
	ERROR
} STATE;

bool isDecDigit(char c)
{
	return c >= '0' && c <= '9';
}

bool isOctDigit(char c)
{
	return c >= '0' && c <= '7' ;
}

bool isHexDigit(char c)
{
	return (c >= '0' && c <= '9') || (c >= 'a' && c <= 'f');
}

STATE nextState(STATE curState, char c)
{
	char lowC = tolower(c);
	switch (curState)
	{
	case START:
		if (lowC == '+' || c == '-') return SIGN;
		if (lowC == '0') return ZERO;
		if (isDecDigit(lowC)) return DEC;
		break;
	case SIGN:
		if (c == '0') return ZERO;
		if (isDecDigit(c)) return DEC;
		break;
	case ZERO:
		if (lowC == ';') return END;
		if (lowC == 'x') return HEX;
		if (isOctDigit(lowC)) return OCT;
		if (lowC == 'u') return SUF_U;
		if (lowC == 'l') return SUF_L;
		break;
	case DEC:
		if (isDecDigit(lowC)) return DEC;
		if (lowC == 'u') return SUF_U;
		if (lowC == 'l') return SUF_L;
		if (lowC == ';') return END;
		break;
	case OCT:
		if (isOctDigit(lowC)) return OCT;
		if (lowC == 'u') return SUF_U;
		if (lowC == 'l') return SUF_L;
		if (lowC == ';') return END;
		break;
	case HEX:
		if (isHexDigit(lowC)) return HEX;
		if (lowC == 'u') return SUF_U;
		if (lowC == 'l') return SUF_L;
		if (lowC == ';') return END;
	case SUF_U:
		if (lowC == 'l') return SUF_UL;
		if (lowC == ';') return END;
		break;
	case SUF_L:
		if (lowC == 'l') return SUF_LL;
		if (lowC == 'u') return SUF_LU;
		if (lowC == ';') return END;
		break;
	case SUF_LL:
		if (lowC == 'u') return SUF_LLU;
		if (lowC == ';') return END;
		break;
	case SUF_UL:
		if (lowC == 'l') return SUF_ULL;
		if (lowC == ';') return END;
		break;
	case SUF_LU:
		if (lowC == ';') return END;
		break;
	case SUF_LLU:
		if (lowC == ';') return END;
		break;
	case SUF_ULL:
		if (lowC == ';') return END;
		break;
	case END:
		if (lowC == ';') return END;
		return ERROR;
	}
	return ERROR;
}

bool isValidConst(const char* input)
{
	STATE state = START;
	for (int i = 0; i < strlen(input); i++) {
		state = nextState(state, input[i]);
		if (state == ERROR) {
			return false;
		}
	}
	return state == END;
}

int main()
{
	for (int i = 0; testCases[i] != NULL; i++) {
		if (isValidConst(testCases[i])) {
			printf("'%s' is a valid constant.\n", testCases[i]);
		}
		else {
			printf("'%s' is not a valid constant.\n", testCases[i]);
		}
	}
	return 0;
}