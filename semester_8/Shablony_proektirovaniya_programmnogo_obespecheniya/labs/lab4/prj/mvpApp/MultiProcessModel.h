#ifndef MULTIPROCESSMODEL_H
#define MULTIPROCESSMODEL_H

#include <string>
#include <vector>

struct MultiProcessModel
{
    struct Process
    {
        std::string exePath;
        std::vector<std::string> args;
        bool running = false;
        int pid = -1;
    };

    std::vector<Process> processes;
};

#endif // MULTIPROCESSMODEL_H