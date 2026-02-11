#include "observer.h"

void BaseSubject::attach(Observer* observer) {
    if (observer) {
        observers.insert(observer);
    }
}

void BaseSubject::detach(Observer* observer) {
    observers.erase(observer);
}

void BaseSubject::notify() {
    for (auto* observer : observers) {
        if (observer) {
            observer->update(message);
        }
    }
}

void BaseSubject::setMessage(const std::string& msg) {
    message = msg;
}

const std::string& BaseSubject::getMessage() const {
    return message;
}