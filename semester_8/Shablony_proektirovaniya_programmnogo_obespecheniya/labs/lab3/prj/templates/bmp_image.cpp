#include "bmp_image.h"
#include <fstream>

bool bmp_image::load(const std::string& path)
{
    std::ifstream file(path, std::ios::binary);
    if (!file)
        return false;

    file.seekg(18);
    file.read(reinterpret_cast<char*>(&width), 4);
    file.read(reinterpret_cast<char*>(&height), 4);

    return true;
}

int bmp_image::get_width() const
{
    return width;
}

int bmp_image::get_height() const
{
    return height;
}