#ifndef PROCESSSERVICE_H
#define PROCESSSERVICE_H

#include <string>
#include <vector>
#include <windows.h>
#include <iostream>

class ProcessService
{
public:

    int start(const std::string& exe, const std::vector<std::string>& args)
    {
        std::string cmd = exe;

        for (auto& a : args) 
        {
            cmd += " " + a;
        }

        STARTUPINFOA si = { sizeof(si) };
        PROCESS_INFORMATION pi = {};

        if (!CreateProcessA(
            nullptr,
            const_cast<char*>(cmd.c_str()),
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

        CloseHandle(pi.hThread);
        CloseHandle(pi.hProcess);

        return pi.dwProcessId;
    }

    void stop(int pid)
    {
        HANDLE hProcess = OpenProcess(
            PROCESS_TERMINATE | SYNCHRONIZE,
            FALSE,
            pid);

        if (!hProcess)
        {
            std::cerr << "Can't open process PID=" << pid << "\n";
            return;
        }

        DWORD status = WaitForSingleObject(hProcess, 0);
        if (status == WAIT_OBJECT_0)
        {
            CloseHandle(hProcess);
            return;
        }

        TerminateProcess(hProcess, 0);
        CloseHandle(hProcess);
    }
};

#endif