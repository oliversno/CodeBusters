#ifndef GRADER_H
#define GRADER_H

#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <algorithm>
#include <numeric>

std::stringstream nextLine(std::istream& is) {
    std::string temp;
    std::getline(is, temp);
    std::stringstream os(temp);
    return os;
}

char space2underscoreOp(char c) {
	if(c == ' ')
		return '_';
	return c;
}

std::string space2underscoreStr(std::string str) {
	std::string res;
	res.resize(str.size());
	std::transform(str.begin(), str.end(), res.begin(), space2underscoreOp);
	return res;
}

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

struct Question {
    std::string ans;
    int pts;
    int tiebreaker_order;
};

class tieFunctor {
    private:
        int rank;
    public:
        tieFunctor(int in) {
            rank = in;
        }
        bool operator()(Question q) {
            return q.tiebreaker_order == rank;
        }
};

class Score {
    private:
        std::string team_name;
        int team_num;
        std::vector<int> points;
        int total_points;
        std::vector<Question> questions;
	int time_bonus;
    public:
    Score(void) { //ctor
        team_name = "NONE";
        team_num = -1;
        total_points = -1;
	time_bonus = 0;
    }
    ~Score(void) { //dtor
        points.clear();
    }
    bool operator<(const Score& other_team) const {
        if(total_points == other_team.total_points) {
            size_t tie_number = 1;
            while(tie_number <= questions.size()) {
                tieFunctor pred(tie_number);
                int pos = std::distance(questions.begin(), std::find_if(questions.begin(), questions.end(), pred));
                if(points[pos] == other_team.points[pos]) {
                    tie_number++;
                }
                else {
                    return points[pos] > other_team.points[pos];
                 }
            }

        }
        return total_points > other_team.total_points;
        //TODO: Logic for tiebreakers
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
            for(size_t i = 0; i < key.ans.length(); i++) {
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
        total_points = std::accumulate(points.begin(), points.end(), 0) + time_bonus;
    }
    void addBonus(const int time) {
	time_bonus = 4*(600-time);
    }
    std::string getTeamName() const {
        return team_name;
    }
    int getTeamNum() const {
        return team_num;
    }
    int getTotalScore() const {
        return total_points;
    }
    void setTeamNum(const int num_in) {
        team_num = num_in;
    }
    void setTeamName(std::string& name_in) {
        team_name = name_in;
    }
    void setQuestions(std::vector<Question> q_in) {
        questions = q_in;
    }
};


#endif // GRADER_H
