#ifdef GRADER_H
#define GRADER_H
#include<iostream>
#include <fstream>
#include <string>

std::string nextLine(istream& is) {
    std::string temp;
    std::getline(is, temp);
    return temp;
}

#endif // GRADER_H
