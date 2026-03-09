#ifndef SINGLEPROCESSMODEL_H
#define SINGLEPROCESSMODEL_H

#include <string>
#include <vector>

struct SingleProcessModel
{
    std::string exePath;
    std::vector<std::string> args;

    bool running = false;
    int pid = -1;
};

#endif // SINGLEPROCESSMODEL_H