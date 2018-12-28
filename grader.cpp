#include "grader.h"

int main(int argc, char** argv) {
  if (argc < 3) {
    std::cerr << "Must have at least an answer key and one student answer sheet\n";
    exit (1);
    if (argv[1] != "KEY.txt") {
      std::cerr << "Answer Key not named correctly\n";
      exit(1);
    }
    int numStudentAns = argc - 2;
    std::ifstream fKeyIn;
    fKeyIn.open(argv[1]);
    std::vector<Score> teams;
    teams.reserve(numStudentAns);
    for(int i = 0; i < numStudentAns;  i++){
        std::ifstream fFormIn;
        fFormIn.open(argv[i+2]);
        std::istringstream team_info = nextLine(fFormIn);
        teams[i].setInfo(team_info);
        nextLine(fKeyIn);
        while(!fKeyIn.eof()) {
          std::istringstream line = nextLine(fKeyIn);
          Question correct;
          line >> correct.ans >> correct.pts;

          std::string team_ans;
          fFormIn >> team_ans;

          teams[i].scoreAns(correct, team_ans);
      }
      teams[i].sumPoints();
      fKeyIn.clear();
      fKeyIn.seekg(0, std::ios::beg);
    }
    
    std::sort(teams.begin(), teams.end());
    
  }
}