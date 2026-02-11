#ifndef OBSERVER_H
#define OBSERVER_H

#include <string>
#include <unordered_set>

class Observer {
public:
    virtual void update(const std::string& message) = 0;
    virtual ~Observer() = default;
};

class Subject {
public:
    virtual void attach(Observer* observer) = 0;
    virtual void detach(Observer* observer) = 0;
    virtual void notify() = 0;
    virtual ~Subject() = default;
};

class BaseSubject : public Subject {
private:
    std::unordered_set<Observer*> observers;
    std::string message;

public:
    BaseSubject() = default;
    ~BaseSubject() override = default;

    void attach(Observer* observer) override;
    void detach(Observer* observer) override;
    void notify() override;

    void setMessage(const std::string& msg);
    const std::string& getMessage() const;
};

#endif // OBSERVER_H
