#ifndef PRESENTERBASE_H
#define PRESENTERBASE_H

#include "IPresenter.h"

template<typename ModelT, typename ViewT>
class PresenterBase : public IPresenter
{
public:
    PresenterBase(ModelT& model, ViewT& view)
        : model_(model), view_(view) {
    }

protected:
    ModelT& model_;
    ViewT& view_;
};

#endif // PRESENTERBASE_H