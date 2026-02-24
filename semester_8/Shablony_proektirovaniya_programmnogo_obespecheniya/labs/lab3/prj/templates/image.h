#ifndef IMAGE_H
#define IMAGE_H

#include <string>

class image
{
public:
    virtual ~image() = default;

    virtual bool load(const std::string& path) = 0;
    virtual int get_width() const = 0;
    virtual int get_height() const = 0;
};

#endif
