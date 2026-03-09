#ifndef IVIEW_H
#define IVIEW_H

#include <string>
#include "IPresenter.h"

template<typename PresenterT = IPresenter>
class IView
{
public:
    virtual ~IView() = default;

    virtual void setPresenter(PresenterT* presenter) = 0;

    virtual void showStarted(int pid) = 0;
    virtual void showStopped(int pid) = 0;
    virtual void showMessage(const std::string& msg) = 0;

    virtual void run() = 0;
};

#endif // IVIEW_H