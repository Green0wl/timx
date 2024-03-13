#include "argument_processor.h"

#include <string>
#include <vector>

int validatePlusArgs(const std::vector<std::string>& plus_args,
                     const std::regex& valid_arg_regex) {
  if (plus_args.empty()) {
    return 1;
  }

  for (const std::string& arg : plus_args) {
    if (!std::regex_search(arg, valid_arg_regex)) {
      return 1;
    }
  }

  return 0;
}

void selectPlusArguments(int& argc, char**& argv,
                         std::vector<std::string>& plus_args) {
  for (int i = 1; i < argc; ++i) {
    std::string arg = argv[i];
    if (arg[0] == '+') {
      plus_args.push_back(arg);
    }
  }
}
