#ifndef PROCESSSERVICE_H
#define PROCESSSERVICE_H

#include <string>
#include <vector>
#include <windows.h>
#include <sstream>
#include <iostream>

class ProcessService
{
public:
    // Запуск процесса, возвращает PID
    int start(const std::string& exe, const std::vector<std::string>& args)
    {
        std::string cmd = exe;
        for (auto& a : args)
            cmd += " " + a;

        STARTUPINFOA si = { sizeof(si) };
        PROCESS_INFORMATION pi = {};

        // Создаем процесс
        if (!CreateProcessA(
            nullptr,
            const_cast<char*>(cmd.c_str()), // CreateProcessA требует char*
            nullptr,
            nullptr,
            FALSE,
            CREATE_NEW_CONSOLE,
            nullptr,
            nullptr,
            &si,
            &pi))
        {
            std::cerr << "Can't start process: " << cmd << "\n";
            return -1;
        }

        // Закрываем ненужные хэндлы
        CloseHandle(pi.hThread);
        CloseHandle(pi.hProcess);

        return pi.dwProcessId;
    }

    // Остановить процесс по PID
    void stop(int pid)
    {
        HANDLE hProcess = OpenProcess(PROCESS_TERMINATE | SYNCHRONIZE, FALSE, pid);
        if (!hProcess)
        {
            std::cerr << "Can't open process PID=" << pid << ", error=" << GetLastError() << "\n";
            return;
        }

        DWORD status = WaitForSingleObject(hProcess, 0);
        if (status == WAIT_OBJECT_0)
        {
            std::cout << "Process already exited PID=" << pid << "\n";
            CloseHandle(hProcess);
            return;
        }

        if (!TerminateProcess(hProcess, 0))
        {
            std::cerr << "Can't stop process PID=" << pid << ", error=" << GetLastError() << "\n";
        }

        CloseHandle(hProcess);
    }
};

#endif // PROCESSSERVICE_H