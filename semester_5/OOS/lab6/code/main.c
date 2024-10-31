#include <windows.h>
#include <stdio.h>

HHOOK hHook = NULL;
typedef LRESULT (*KeyboardProc)(int, WPARAM, LPARAM);

int main() {
    HMODULE hHookLib = LoadLibrary(TEXT("keyHook.dll"));
    if (hHookLib == NULL) {
        wprintf(L"Error when loading DLL\n");
        return 0;
    }

    KeyboardProc keyboardProc = (KeyboardProc)GetProcAddress(hHookLib, "KeyboardProc");
    int* pStopFlag = (int*)GetProcAddress(hHookLib, "stopFlag"); 

    if (!keyboardProc || !pStopFlag) {
        wprintf(L"Error when finding function or stopFlag\n");
        FreeLibrary(hHookLib);
        return 1;
    }

    if (hHook == NULL) {
        hHook = SetWindowsHookEx(WH_KEYBOARD_LL, keyboardProc, hHookLib, 0);
        if (hHook == NULL) {
            wprintf(L"Failed to set hook\n");
            FreeLibrary(hHookLib);
            return 1;
        }
    }

    MSG msg;
    while (1) {
        if (*pStopFlag) {
            PostQuitMessage(0);  
            break;               
        }
        if (PeekMessage(&msg, NULL, 0, 0, PM_REMOVE)) {
            TranslateMessage(&msg);
            DispatchMessage(&msg);
            if (msg.message == WM_QUIT) {
                break;
            }
        }
    }

    if (hHook != NULL) {
        UnhookWindowsHookEx(hHook);
        hHook = NULL;
    }
    FreeLibrary(hHookLib);

    return 0;
}
