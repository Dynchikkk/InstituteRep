#ifndef KEY_HOOK
#define KEY_HOOK

#ifdef KEY_HOOL_EXPORTS
#define KEY_HOOK_API __declspec(dllexport)
#else
#define KEY_HOOK_API __declspec(dllimport)
#endif

KEY_HOOK_API extern int stopFlag;
KEY_HOOK_API LRESULT CALLBACK KeyboardProc(int nCode, WPARAM wParam, LPARAM lParam);

#endif