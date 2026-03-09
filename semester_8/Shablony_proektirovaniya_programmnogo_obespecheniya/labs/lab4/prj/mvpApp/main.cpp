#include <iostream>
#include <sstream>
#include <vector>
#include "ProcessService.h"
#include "SingleProcessModel.h"
#include "ConsoleView.h"
#include "SingleProcessPresenter.h"
#include "MultiProcessModel.h"
#include "MultiProcessPresenter.h"

int main()
{
    ProcessService service;

    std::cout << "Choose mode:\n";
    std::cout << "1 - single process\n";
    std::cout << "2 - multi process\n";
    int choice = 0;
    std::cin >> choice;
    std::cin.ignore();

    if (choice == 1)
    {
        std::cout << "Insert application path: ";
        SingleProcessModel model;
        std::getline(std::cin, model.exePath);

        std::cout << "Insert args, separated by space: ";
        std::string argsLine;
        std::getline(std::cin, argsLine);

        if (!argsLine.empty())
        {
            std::istringstream iss(argsLine);
            std::string arg;
            while (iss >> arg)
                model.args.push_back(arg);
        }

        ConsoleView<IPresenter> view;
        SingleProcessPresenter presenter(model, view, service);
        view.setPresenter(&presenter);

        view.run();
    }
    else if (choice == 2)
    {
        MultiProcessModel model;
        int n = 0;
        std::cout << "Insert application count: ";
        std::cin >> n;
        std::cin.ignore();

        for (int i = 0; i < n; ++i)
        {
            MultiProcessModel::Process p;
            std::cout << "Insert application #" << (i + 1) << " path: ";
            std::getline(std::cin, p.exePath);

            std::cout << "Insert args, separated by space: ";
            std::string argsLine;
            std::getline(std::cin, argsLine);

            if (!argsLine.empty())
            {
                std::istringstream iss(argsLine);
                std::string arg;
                while (iss >> arg)
                    p.args.push_back(arg);
            }

            model.processes.push_back(p);
        }

        ConsoleView<IPresenter> view;
        MultiProcessPresenter presenter(model, view, service);
        view.setPresenter(&presenter);

        view.run();
    }
    else
    {
        std::cout << "Incorrect choice.\n";
    }

    return 0;
}