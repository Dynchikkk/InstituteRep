#include <iostream>

#include "ConsoleView.h"
#include "ProcessService.h"

#include "SingleProcessModel.h"
#include "SingleProcessPresenter.h"

#include "MultiProcessModel.h"
#include "MultiProcessPresenter.h"

int main()
{
    ProcessService service;

    std::cout << "Mode:\n";
    std::cout << "1 - single\n";
    std::cout << "2 - multi\n";

    int choice;
    std::cin >> choice;

    ConsoleView<IPresenter> view;

    if (choice == 1)
    {
        SingleProcessModel model;
        SingleProcessPresenter presenter(model, view, service);

        view.setPresenter(&presenter);
        view.run();
    }
    else
    {
        MultiProcessModel model;
        MultiProcessPresenter presenter(model, view, service);

        view.setPresenter(&presenter);
        view.run();
    }

    return 0;
}