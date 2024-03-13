#include <string>
#include <vector>

#include "argument_processor.h"
#include "constants.h"

int main(int argc, char* argv[]) {
  std::vector<std::string> plus_args;
  selectPlusArguments(argc, argv, plus_args);

  validatePlusArgs(plus_args, constants::valid_arg_regex);

  return 0;
}
