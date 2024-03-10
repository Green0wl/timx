#include <string>
#include <vector>

#include "argument_processor.h"

int main(int argc, char *argv[]) {
  std::vector<std::string> plus_args;
  selectPlusArguments(argc, argv, plus_args);

  return 0;
}
