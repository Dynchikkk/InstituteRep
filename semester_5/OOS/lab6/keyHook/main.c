#include <windows.h>
#include <stdio.h>
#include "keyHook.h"
 
int stopFlag = 0;

LRESULT CALLBACK KeyboardProc(int nCode, WPARAM wParam, LPARAM lParam) {
    if (nCode == HC_ACTION) {
        if (wParam == WM_KEYDOWN || wParam == WM_SYSKEYDOWN) {
            KBDLLHOOKSTRUCT* pKeyboard = (KBDLLHOOKSTRUCT*)lParam;
            if ((GetAsyncKeyState(VK_MENU) & 0x8000) && pKeyboard->vkCode == 'S') {
                wprintf(L"Alt+S pressed");
                stopFlag = 1;
            }
        }
    }
    return CallNextHookEx(NULL, nCode, wParam, lParam);
}