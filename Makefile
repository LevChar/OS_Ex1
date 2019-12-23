# Makefile of #1 exercise - Semester A (winter) 2019

OS := $(shell uname)
CC = @ gcc -std=c99
$ TIME = $(shell date +"%T.%3N")
SRC = $(wildcard src/*.c)
obj = $(SRC:.c=.o) 
CFLAGS = -Wall
OUTPUT_FILENAME_FLAG = -o
PROG = ex1_q1$(EXT)

ifneq (,$(findstring CYGWIN,$(OS)))
  EXT = .exe
else
  EXT =
endif

all : $(PROG) test

################	echo -e “\\e[0;41mBackground in Red Color\\e[0m”


$(PROG) : $(obj)
	@echo ===========================================================
	@echo -e Compilation of target "\\e[5;41m$@\\e[0m" started at "\\e[5;41m$(TIME)\\e[0m"
	@echo ===========================================================
	
	@$(CC) $(CFLAGS) $^ $(OUTPUT_FILENAME_FLAG) $(PROG)	
	
	@echo ===========================================================
	@echo -e Executing compilation for changed targets: "\\e[5;41m$?\\e[0m"
	@echo ===========================================================
	
	@echo ===========================================================
	@echo -e Compilation of target "\\e[5;41m$@\\e[0m" started at "\\e[5;41m$(TIME)\\e[0m"
	@echo ===========================================================
	
clean:
	@rm -f $(OUTPUT_FILE_FILE) *.exe out.log src/*.o
	@echo ===========================================================
	@echo Binary and Obj files were cleaned!
	@echo ===========================================================

test:
	@echo ===========================================================
	@echo -e Execution of "\\e[5;41m$@\\e[0m" "\\e[5;41m$(PROG)\\e[0m" started at: "\\e[5;41m$(TIME)\\e[0m"
	@echo ===========================================================
	
	@./$(PROG) < in.txt > out.log
	
	@echo ===========================================================
	@echo -e Execution of "\\e[5;41m$@\\e[0m" "\\e[5;41m$(PROG)\\e[0m" finished at: "\\e[5;41m$(TIME)\\e[0m"
	@echo ===========================================================
	@echo
	@echo
	@echo ===========================================================
	@echo -e "\\e[1;43mResults:\\e[0m"
	@echo ===========================================================
	@cat out.log