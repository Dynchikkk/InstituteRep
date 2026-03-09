#ifndef CONSOLEVIEW_H
#define CONSOLEVIEW_H

#include <iostream>
#include <string>
#include "IPresenter.h"
#include "IView.h"

template<typename PresenterT = IPresenter>
class ConsoleView : public IView<PresenterT>
{
public:
    void setPresenter(PresenterT* presenter) override
    {
        presenter_ = presenter;
    }

    void showStarted(int pid) override
    {
        std::cout << "Started PID=" << pid << "\n";
    }

    void showStopped(int pid) override
    {
        std::cout << "Stopped PID=" << pid << "\n";
    }

    void showMessage(const std::string& msg) override
    {
        std::cout << msg << "\n";
    }

    void run() override
    {
        while (true)
        {
            std::cout << "Wait for command\n";

            std::string cmd;
            std::cin >> cmd;

            if (cmd == "start") presenter_->start();
            else if (cmd == "stop") presenter_->stop();
            else if (cmd == "exit") break;
            else std::cout << "Unknown command\n";
        }

        std::cout << "Goodbye\n";
    }

private:
    PresenterT* presenter_;
};

#endif // CONSOLEVIEW_H