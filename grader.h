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

struct Question {
    std::string ans;
    int pts;
};

struct Score {
    std::string team_name;
    int team_num;
    std::vector<int> points;
};

void scoreAns(Question key, std::string ans, Score& team) {
    int errors = -2;
    for(int i = 0; i <key.ans.length(); i++) {
        if(key.ans[i] != ans[i])
            errors++;
    }
    
    if(errors <= 0) {
        team.points.push_back(key.pts);
    }
    else {
        int penalty = errors*100;
        team.points.push_back(std::max(0, key.pts - penalty));
    }
}
#endif // GRADER_H
