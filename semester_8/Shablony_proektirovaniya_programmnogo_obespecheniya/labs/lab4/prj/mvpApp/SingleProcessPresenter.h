#ifndef SINGLEPROCESSPRESENTER_H
#define SINGLEPROCESSPRESENTER_H

#include "PresenterBase.h"
#include "SingleProcessModel.h"
#include "ProcessService.h"
#include "IView.h"

class SingleProcessPresenter : public PresenterBase<SingleProcessModel, IView<IPresenter>>
{
public:
    using ViewT = IView<IPresenter>;

    SingleProcessPresenter(SingleProcessModel& model, ViewT& view, ProcessService& service) 
        : PresenterBase(model, view), service_(service)
    {
    }

    void addProcess(const std::string& path, const std::vector<std::string>& args) override
    {
        if (model_.running)
        {
            view_.showMessage("Stop process first");
            return;
        }

        model_.exePath = path;
        model_.args = args;
        view_.showMessage("Process set");
    }

    void removeProcess(size_t) override
    {
        if (model_.running)
        {
            view_.showMessage("Stop process first");
            return;
        }

        model_.exePath.clear();
        model_.args.clear();
    }

    void listProcesses() override
    {
        if (model_.exePath.empty())
        {
            view_.showMessage("No process");
            return;
        }

        view_.showProcess(0, model_.exePath, model_.running, model_.pid);
    }

    void start() override
    {
        if (model_.running)
        {
            view_.showMessage("Already running");
            return;
        }

        if (model_.exePath.empty())
        {
            view_.showMessage("No process configured");
            return;
        }

        int pid = service_.start(model_.exePath, model_.args);
        model_.pid = pid;
        model_.running = true;
        view_.showStarted(pid);
    }

    void stop() override
    {
        if (!model_.running)
        {
            return;
        }

        service_.stop(model_.pid);

        model_.running = false;

        view_.showStopped(model_.pid);
    }

private:
    ProcessService& service_;
};

#endif