#ifndef CONSOLEVIEW_H
#define CONSOLEVIEW_H

#include <iostream>
#include <sstream>
#include <vector>
#include "IView.h"
#include "IPresenter.h"

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

    void showProcess(size_t index, const std::string& path, bool running, int pid) override
    {
        std::cout << index << ": " << path;

        if (running)
        {
            std::cout << " [running pid=" << pid << "]";
        }

        std::cout << "\n";
    }

    void run() override
    {
        while (true)
        {
            std::cout << "\nCommands: add remove list start stop exit\n";
            std::cout << "> ";

            std::string cmd;
            std::cin >> cmd;

            if (cmd == "add")
            {
                std::cin.ignore();

                std::string path;
                std::cout << "Path: ";
                std::getline(std::cin, path);

                std::string argsLine;
                std::cout << "Args: ";
                std::getline(std::cin, argsLine);

                std::vector<std::string> args;

                std::istringstream iss(argsLine);
                std::string arg;

                while (iss >> arg)
                {
                    args.push_back(arg);
                }

                presenter_->addProcess(path, args);
            }
            else if (cmd == "remove")
            {
                size_t index;
                std::cin >> index;

                presenter_->removeProcess(index);
            }
            else if (cmd == "list")
            {
                presenter_->listProcesses();
            }
            else if (cmd == "start")
            {
                presenter_->start();
            }
            else if (cmd == "stop")
            {
                presenter_->stop();
            }
            else if (cmd == "exit")
            {
                break;
            }
            else
            {
                std::cout << "Unknown command\n";
            }
        }
    }

private:
    PresenterT* presenter_ = nullptr;
};

#endif