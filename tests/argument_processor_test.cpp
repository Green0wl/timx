#include "argument_processor.h"

#include <gtest/gtest.h>

TEST(ArgumentProcessorTest, SelectPlusArgumentsTest) {
  char* argv[] = {(char*)"program", (char*)"+arg1", (char*)"arg2",
                  (char*)"+arg3", (char*)"a+arg4"};
  int argc = sizeof(argv) / sizeof(argv[0]);

  std::vector<std::string> plusArgs;

  int tempArgc = argc;
  char** tempArgv = argv;

  selectPlusArguments(tempArgc, tempArgv, plusArgs);

  ASSERT_EQ(plusArgs.size(), 2);
  ASSERT_EQ(plusArgs[0], "+arg1");
  ASSERT_EQ(plusArgs[1], "+arg3");
}

int main(int argc, char* argv[]) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
