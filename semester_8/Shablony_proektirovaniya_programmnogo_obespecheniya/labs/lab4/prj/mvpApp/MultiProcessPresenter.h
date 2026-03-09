#ifndef MULTIPROCESSPRESENTER_H
#define MULTIPROCESSPRESENTER_H

#include "IView.h"
#include "MultiProcessModel.h"
#include "PresenterBase.h"
#include "ProcessService.h"

class MultiProcessPresenter : public PresenterBase<MultiProcessModel, IView<IPresenter>>
{
public:
    using ViewT = IView<IPresenter>;

    MultiProcessPresenter(MultiProcessModel& model, ViewT& view, ProcessService& service)
        : PresenterBase(model, view), service_(service) {
    }

    void start() override
    {
        for (auto& p : model_.processes)
        {
            if (p.running) continue;

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
            if (!p.running) continue;

            service_.stop(p.pid);
            p.running = false;

            view_.showStopped(p.pid);
        }
    }

private:
    ProcessService& service_;
};

#endif // MULTIPROCESSPRESENTER_H