#ifndef IPRESENTER_H
#define IPRESENTER_H

#include <string>
#include <vector>

class IPresenter
{
public:
    virtual ~IPresenter() = default;

    virtual void start() = 0;
    virtual void stop() = 0;

    virtual void addProcess(const std::string& path, const std::vector<std::string>& args) = 0;
    virtual void removeProcess(size_t index) = 0;

    virtual void listProcesses() = 0;
};

#endif