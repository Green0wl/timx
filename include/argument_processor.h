#ifndef ARGUMENT_PROCESSOR_H_
#define ARGUMENT_PROCESSOR_H_

#include <regex>
#include <string>
#include <vector>

void selectPlusArguments(int &argc, char **&argv,
                         std::vector<std::string> &plus_args);

int validatePlusArgs(const std::vector<std::string> &plus_args,
                     const std::regex &valid_arg_regex);

#endif  // !ARGUMENT_PROCESSOR_H_
