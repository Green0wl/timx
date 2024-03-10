# Compiler
CXX = g++

# Compiler flags
CFLAGS = -Wall -std=c++2b -Iinclude

# Directories
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin
TEST_DIR = tests
TEST_BIN_DIR = $(BIN_DIR)/tests

# Source files
SRC = $(wildcard $(SRC_DIR)/*.cpp)
OBJ = $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(SRC))

# Google Test
GTEST_LIB = /usr/local/lib/libgtest.a
GTEST_INC = /usr/local/include/gtest

# Test source files
TEST_SRC = $(wildcard $(TEST_DIR)/*.cpp)
TEST_OBJ = $(patsubst $(TEST_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(TEST_SRC))

# Linker flags
LDLIBS = -pthread

# Main target
TARGET = $(BIN_DIR)/timx
TEST_TARGET = $(TEST_BIN_DIR)/$(basename $(notdir $(wildcard $(TEST_DIR)/*.cpp)))

# Default target - builds the main target
all: $(TARGET)

# Target to build tests
test: $(TEST_TARGET)

# Target to debug Makefile variables
debug:
	@echo SRC: $(SRC)
	@echo OBJ: $(OBJ)
	@echo OBJ_NEEDED_TO_TEST: $(patsubst $(OBJ_DIR)/%_test.o, $(OBJ_DIR)/%.o, $(TEST_OBJ))

# Rule to build the main target
$(TARGET): $(OBJ)
	mkdir -p $(BIN_DIR)
	$(CXX) $^ -o $@

# Rule to compile source files into object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	mkdir -p $(OBJ_DIR)
	$(CXX) $(CFLAGS) -c $< -o $@

# Rule to build tests
$(TEST_TARGET): $(TEST_OBJ) $(patsubst $(OBJ_DIR)/%_test.o, $(OBJ_DIR)/%.o, $(TEST_OBJ))
	mkdir -p $(TEST_BIN_DIR)
	$(CXX) $(CFLAGS) -I$(GTEST_INC) $^ $(GTEST_LIB) -o $@ $(LDLIBS)

# Rule to compile test source files into object files
$(OBJ_DIR)/%.o: $(TEST_DIR)/%.cpp
	mkdir -p $(OBJ_DIR)
	$(CXX) $(CFLAGS) -c $< -o $@

# Clean rule
clean:
	rm -rf $(OBJ_DIR)/*.o $(OBJ_DIR)/tests/*.o $(TARGET) $(TEST_TARGET)

# Phony targets
.PHONY: all clean test debug

