CC = g++
CFLAGS = -Wall -std=c++2b -Iinclude
LDFLAGS = 

SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin

SRC = $(wildcard $(SRC_DIR)/*.cpp)
OBJ = $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(SRC))

TARGET = $(BIN_DIR)/timx

$(TARGET): $(OBJ)
	mkdir -p $(BIN_DIR)
	$(CC) $(LDFLAGS) $^ -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR)/*.o $(TARGET)

.PHONY: clean

