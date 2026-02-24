#include <iostream>
#include "bmp_image_name_proxy.h"

#define PIC1_NAME = "pic1_200x157.bmp"
#define PIC2_NAME = "pic2.bmp"
#define PIC3_NAME = "pic3_123xmax.bmp"

int main()
{
    std::string path;

    std::cout << "Insert BMP image path: ";
    std::getline(std::cin, path);

    bmp_image_name_proxy image;

    if (!image.load(path))
    {
        std::cout << "Can't get image size\n";
        return 0;
    }

    std::cout << "Image size: " << image.get_width() << " x " << image.get_height() << std::endl;

    return 0;
}