#ifndef MULTIPROCESSPRESENTER_H
#define MULTIPROCESSPRESENTER_H

#include "PresenterBase.h"
#include "MultiProcessModel.h"
#include "ProcessService.h"
#include "IView.h"

class MultiProcessPresenter
    : public PresenterBase<MultiProcessModel, IView<IPresenter>>
{
public:
    using ViewT = IView<IPresenter>;

    MultiProcessPresenter(MultiProcessModel& model, ViewT& view, ProcessService& service) 
        : PresenterBase(model, view), service_(service)
    {
    }

    void addProcess(const std::string& path,
        const std::vector<std::string>& args) override
    {
        MultiProcessModel::Process p;
        p.exePath = path;
        p.args = args;
    model_.processes.push_back(p);

        view_.showMessage("Process added");
    }

    void removeProcess(size_t index) override
    {
        if (index >= model_.processes.size())
        {
            view_.showMessage("Invalid index");
            return;
        }

        model_.processes.erase(model_.processes.begin() + index);
    }

    void listProcesses() override
    {
        for (size_t i = 0; i < model_.processes.size(); ++i)
        {
            auto& p = model_.processes[i];
            view_.showProcess(i, p.exePath, p.running, p.pid);
        }
    }

    void start() override
    {
        for (auto& p : model_.processes)
        {
            if (p.running)
            {
                continue;
            }

            int pid = service_.start(p.exePath, p.args);

            p.pid = pid;
            p.running = true;
            view_.showStarted(pid);
        }
    }

    void stop() override
    {
        for (auto& p : model_.processes)
        {
            if (!p.running)
            {
                continue;
            }

            service_.stop(p.pid);
            p.running = false;
            view_.showStopped(p.pid);
        }
    }

private:
    ProcessService& service_;
};

#endif