#ifndef SINGLEPROCESSPRESENTER_H
#define SINGLEPROCESSPRESENTER_H

#include "IView.h"
#include "SingleProcessModel.h"
#include "PresenterBase.h"
#include "ProcessService.h"

class SingleProcessPresenter : public PresenterBase<SingleProcessModel, IView<IPresenter>>
{
public:
    using ViewT = IView<IPresenter>;

    SingleProcessPresenter(SingleProcessModel& model, ViewT& view, ProcessService& service)
        : PresenterBase(model, view), service_(service) {
    }

    void start() override
    {
        if (model_.running)
        {
            view_.showMessage("Process already running");
            return;
        }

        int pid = service_.start(model_.exePath, model_.args);
        model_.pid = pid;
        model_.running = true;

        view_.showStarted(pid);
    }

    void stop() override
    {
        if (!model_.running) return;

        service_.stop(model_.pid);
        model_.running = false;

        view_.showStopped(model_.pid);
    }

private:
    ProcessService& service_;
};

#endif // SINGLEPROCESSPRESENTER_H