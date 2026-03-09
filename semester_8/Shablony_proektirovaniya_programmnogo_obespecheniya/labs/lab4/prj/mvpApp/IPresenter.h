#ifndef IPRESENTER_H
#define IPRESENTER_H

class IPresenter
{
public:
    virtual ~IPresenter() = default;

    virtual void start() = 0;
    virtual void stop() = 0;
};

#endif // IPRESENTER_H