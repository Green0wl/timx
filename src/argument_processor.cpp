#include "argument_processor.h"

#include <string>
#include <vector>

void selectPlusArguments(int &argc, char **&argv,
                         std::vector<std::string> &plus_args) {
  for (int i = 1; i < argc; ++i) {
    std::string arg = argv[i];
    if (arg[0] == '+') {
      plus_args.push_back(arg);
    }
  }
}
