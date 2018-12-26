#include "grader.h"
#include <vector>
#include <algorithm>

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
    nextLine(fKeyIn);
    for(int i = 0; i < numStudentAns;  i++){
        std::ifstream fFormIn;
        fFormIn.open(argv[i+2]);
        Score team;
        std::istringstream team_info = nextLine(fFormIn);
        team_info >> team.team_name >> team.team_num;

        std::istringstream line = nextLine(fKeyIn);
        Question correct;
        line >> correct.ans >> correct.pts;

        std::string team_ans;
        fFormIn >> team_ans;

        scoreAns(correct, team_ans, team);
    }
  }
}