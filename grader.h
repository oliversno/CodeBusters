#ifndef GRADER_H
#define GRADER_H

#include <iostream>
#include <fstream>
#include <sstream>
#include <string>

std::istringstream nextLine(std::istream& is) {
    std::string temp;
    std::getline(is, temp);
    std::istringstream os(temp);
    return os;
}

#endif // GRADER_H
