#ifndef GRADER_H
#define GRADER_H

#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <algorithm>
#include <numeric>

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

class Score {
    private:
        std::string team_name = "N/A";
        int team_num = -1;
        std::vector<int> points;
        int total_points = -1;
    public:
    void setInfo(std::istream& is) {
        is >> team_name >> team_num;
    }
    void scoreAns(Question key, std::string ans) {
        if(isNumber(key.ans)) {
            int penalty = 0;
            if(key.ans != ans)
                penalty = key.pts;
            points.push_back(key.pts - penalty);
        }
        else {
            int errors = -2;
            for(int i = 0; i <key.ans.length(); i++) {
                if(key.ans[i] != ans[i])
                    errors++;
            }

            if(errors <= 0) {
                points.push_back(key.pts);
            }
            else {
                int penalty = errors*100;
                points.push_back(std::max(0, key.pts - penalty));
            }
        }
    }
    void sumPoints() {
        total_points = std::accumulate(points.begin(), points.end(), 0);
    }
};

bool isNumber(std::string& str) {
    std::string::const_iterator it = str.begin();
    if(!isdigit(*it) && *it != '-')
        return false;
    for(;it != str.end(); it++) {
        if(!isdigit(*it))
            return false;
    }
    return true;
}

#endif // GRADER_H
