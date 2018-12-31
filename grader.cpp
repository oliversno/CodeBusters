#include "grader.h"

int main(int argc, char** argv) {
  if (argc < 3) {
    std::cerr << "Must have at least an answer key and one student answer sheet\n";
    exit (1);
  }
    std::string arg = argv[1];
    if (arg != "KEY.txt") {
      std::cerr << "Answer Key not named correctly\n";
      exit(1);
    }
    int numStudentAns = argc - 2;
    std::ifstream fKeyIn;
    fKeyIn.open(argv[1]);
    std::vector<Score> teams;
    std::vector<Question> answers;
    std::stringstream header = nextLine(fKeyIn);
    std::string header_str = header.str();
    std::string tournament_name = header_str.substr(0, header_str.length() - 23);
    while(!fKeyIn.eof()) {
        std::stringstream line = nextLine(fKeyIn);
        if(line.str() != "") {
          Question correct;
          line >> correct.ans >> correct.pts;
          answers.push_back(correct);
        }
    }
    teams.resize(numStudentAns);
    for(size_t i = 0; i < teams.capacity();  i++){
        std::ifstream fFormIn;
        fFormIn.open(argv[i+2]);
        std::stringstream team_info = nextLine(fFormIn);
        int num;
        std::string name;
        team_info >> num >> name;
        teams[i].setTeamNum(num);
        teams[i].setTeamName(name);
        nextLine(fKeyIn);
        for(Question correct : answers) {
          std::string team_ans;
          fFormIn >> team_ans;
          teams[i].scoreAns(correct, team_ans);
        }
/*         while(!fKeyIn.eof()) {
          std::stringstream line = nextLine(fKeyIn);
          if(line.str() != "") {
            Question correct;
            line >> correct.ans >> correct.pts;

            std::string team_ans;
            fFormIn >> team_ans;

            teams[i].scoreAns(correct, team_ans);
          }
      } */
      fFormIn.close();
      teams[i].sumPoints();
      // fKeyIn.clear();
      // fKeyIn.seekg(0, std::ios::beg);
    }
    // 22 is length of "Codebusters Answer Key" plus 1 for the tab
    std::sort(teams.begin(), teams.end());
    
    std::ofstream fRankingsOut;
    fRankingsOut.open(tournament_name + "_Codebusters_Rankings.txt");
    fRankingsOut <<"Rank\tTeam Name\tTeam Number\tScore\n";
    for(size_t i = 0; i < teams.size(); i++) {
      fRankingsOut << std::to_string(i+1) << '\t' << teams[i].getTeamName() << '\t' <<
        teams[i].getTeamNum() << '\t' << teams[i].getTotalScore() << '\n';
    }
    fRankingsOut.close();
    fKeyIn.close();
  }