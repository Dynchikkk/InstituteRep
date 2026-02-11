#include <iostream>
#include "observer.h"

class TrafficControlCenter : public BaseSubject {
public:
    void setAndNotify(const std::string& msg) {
        setMessage(msg);
        notify();
    }
};

class TrafficPost : public Observer {
private:
    std::string name;

public:
    TrafficPost(const std::string& postName) {
        name = postName;
    }

    void update(const std::string& message) override {
        std::cout << "Post " << name << " receive message: " << message << std::endl;
    }
};

int main() {

    TrafficControlCenter controlCenter;

    TrafficPost post1("1 (Central)");
    TrafficPost post2("2 (North)");
    TrafficPost post3("3 (South)");

    controlCenter.attach(&post1);
    controlCenter.attach(&post2);
    controlCenter.attach(&post3);

    controlCenter.setAndNotify("Attention! Search for the car A123BC");

    std::cout << "\nDisconnect north post...\n" << std::endl;
    controlCenter.detach(&post2);

    controlCenter.setAndNotify("Block traffic on the M5 highway.");

    return 0;
}
