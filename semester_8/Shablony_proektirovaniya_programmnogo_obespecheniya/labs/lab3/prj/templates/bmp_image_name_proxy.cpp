#include "bmp_image_name_proxy.h"
#include <regex>

bmp_image_name_proxy::bmp_image_name_proxy()
    : real_image(std::make_unique<bmp_image>())
{
}

bool bmp_image_name_proxy::extract_size_from_name(const std::string& path)
{
    std::regex pattern(".*_(\\d+)x(\\d+)(\\..*)?$");
    std::smatch match;

    if (std::regex_match(path, match, pattern))
    {
        width = std::stoi(match[1]);
        height = std::stoi(match[2]);
        return true;
    }

    return false;
}

bool bmp_image_name_proxy::load(const std::string& path)
{
    if (extract_size_from_name(path)) 
    {
        return true;
    }

    if (real_image->load(path))
    {
        width = real_image->get_width();
        height = real_image->get_height();
        return true;
    }

    return false;
}

int bmp_image_name_proxy::get_width() const
{
    return width;
}

int bmp_image_name_proxy::get_height() const
{
    return height;
}