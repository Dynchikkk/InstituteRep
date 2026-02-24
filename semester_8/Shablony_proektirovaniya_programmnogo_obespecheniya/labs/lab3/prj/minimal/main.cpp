#include <iostream>
#include <fstream>
#include <string>
#include <regex>

#define PIC1_NAME = "pic1_200x157.bmp"
#define PIC2_NAME = "pic2.bmp"
#define PIC3_NAME = "pic3_123xmax.bmp"

bool try_extract_size_from_name(const std::string& path, int& width, int& height)
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

bool read_bmp_size(const std::string& path, int& width, int& height)
{
    std::ifstream file(path, std::ios::binary);
    if (!file)
    {
        return false;
    }

    file.seekg(18);
    file.read(reinterpret_cast<char*>(&width), 4);
    file.read(reinterpret_cast<char*>(&height), 4);

    return true;
}

int main()
{
    std::string path;
    int width = 0;
    int height = 0;

    std::cout << "Insert BMP image path: ";
    std::getline(std::cin, path);

    if (try_extract_size_from_name(path, width, height))
    {
        std::cout << "Size got from file name\n";
    }
    else
    {
        if (!read_bmp_size(path, width, height))
        {
            std::cout << "Error while open file\n";
            return 0;
        }

        std::cout << "Size got from file\n";
    }

    std::cout << "Image size: " << width << " x " << height << std::endl;

    return 0;
}