#ifndef BMP_IMAGE_H
#define BMP_IMAGE_H

#include "image.h"

class bmp_image : public image
{
private:
    int width = 0;
    int height = 0;

public:
    bool load(const std::string& path) override;
    int get_width() const override;
    int get_height() const override;
};

#endif