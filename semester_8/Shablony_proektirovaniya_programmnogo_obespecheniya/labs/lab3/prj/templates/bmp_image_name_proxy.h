#ifndef BMP_IMAGE_NAME_PROXY_H
#define BMP_IMAGE_NAME_PROXY_H

#include "image.h"
#include "bmp_image.h"
#include <memory>

class bmp_image_name_proxy : public image
{
private:
    std::unique_ptr<bmp_image> real_image;

    int width = 0;
    int height = 0;

    bool extract_size_from_name(const std::string& path);

public:
    bmp_image_name_proxy();

    bool load(const std::string& path) override;
    int get_width() const override;
    int get_height() const override;
};

#endif
