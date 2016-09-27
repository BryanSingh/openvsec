#include <iostream>
#include <sys/types.h>
#include <dirent.h>

#define PORT 2222
#define FILE_PATH "../some_path"

using namespace std;

class commandline
{
    std::cout << "Welcome to the Stetson University Network Analyzer" << std::endl;
}

int main()
{
    WIN32_FIND_DATA data;
    HANDLE h = FindFirstFile(FILE_PATH), &data;
}