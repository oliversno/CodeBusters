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
        std::istringstream line = nextLine(fKeyIn);
        std::string ans;
        int pts;
        line >> ans;
        line >> pts;
        
    }
  }
}