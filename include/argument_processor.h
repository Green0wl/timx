#ifndef ARGUMENT_PROCESSOR_H_
#define ARGUMENT_PROCESSOR_H_

#include <string>
#include <vector>

void selectPlusArguments(int &argc, char **&argv,
                         std::vector<std::string> &plus_args);

#endif  // !ARGUMENT_PROCESSOR_H_
