CC:=gcc
LD:=gcc

CFLAGS:=-Wall -Wextra -O0 -g -std=gnu23 -I./external
LDFLAGS:=-lm -lgsl

BIN:=bin
OBJ:=obj
SRC:=src
INCLUDE:=include


TARGET:=$(BIN)/libnudft.so
VALGRIND_OUT:=val.txt

SRCS:=$(filter-out $(SRC)/main.c, $(shell find $(SRC) -type  f -name "*.c"))
OBJS:=$(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SRCS))
ASMS := $(patsubst $(SRC)/%.c, $(OBJ)/%.s, $(SRCS))

TEST_SRCS:=$(shell find $(SRC) -type  f -name "*.c")
TEST_OBJS:=$(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(TEST_SRCS))

INCLUDES:=$(shell find $(INCLUDE) -type f -name "*.h")

DIRS:=$(patsubst $(SRC)/%, $(OBJ)/%, $(shell find $(SRC)/ -mindepth 1 -type d))

CREATE_DIR_COMMAND:=sh dirs.sh

.PHONY: all clean dirs valgrind format run

all: dirs $(TARGET) $(BIN)/test

$(TARGET): $(OBJS) $(ASMS)
	@echo
	@echo building $@
	@$(CC) $(CFLAGS) $(OBJS) -shared -o $@ $(LDFLAGS)
	@echo built $(TARGET)

$(BIN)/test: $(TEST_OBJS)
	@echo
	@echo building $@
	@$(CC) $(CFLAGS) $(TEST_OBJS) -o $@ $(LDFLAGS)
	@echo built $(TARGET)

$(OBJ)/%.o: $(SRC)/%.c
	@echo building $@
	@$(CC) $(CFLAGS) -fPIC -c $< -o $@
	@echo built $@
	@echo


$(OBJ)/%.s: $(SRC)/%.c
	@echo Generating assembly $@
	@$(CC) $(CFLAGS) -S -masm=intel $< -o $@
	@echo Generated $@
	@echo

dirs:
	@mkdir -p $(BIN)
	@mkdir -p $(OBJ)
	@$(CREATE_DIR_COMMAND) $(DIRS)

clean:
	-@rm -rf $(OBJ)
	-@rm -rf $(BIN)

run: $(TARGET)
	@./$(BIN)/test

valgrind:
	@valgrind --leak-check=full \
         --show-leak-kinds=all \
         --track-origins=yes \
         --verbose \
         --log-file=$(VALGRIND_OUT) \
         ./$(BIN)/test

format:
	@python -m black $(shell find ./src -type f -name "*.py")
	
