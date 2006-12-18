BIN  = c-
TARNAME = cpermann
CC   = g++
CCFLAGS = -DCPLUSPLUS -g  # for use with C++ if file ext is .cc
CFLAGS = -DCPLUSPLUS -g  # for use with C++ if file ext is .c

HDRS = globals.h
SRCS = $(BIN).y globals.cc  $(BIN).l
OBJS = lex.yy.o globals.o  $(BIN).tab.o
LIBS = -lfl -lm 

$(BIN): $(OBJS)
	$(CC) $(CCFLAGS) $(OBJS) $(LIBS) -o $(BIN)

$(BIN).tab.h $(BIN).tab.c: $(BIN).y
	bison -v -t -d $(BIN).y  

lex.yy.c: $(BIN).l $(BIN).tab.h
	flex $(BIN).l  # -d debug

all:    
	touch $(SRCS)
	make

clean:
	rm -f $(OBJS) $(BIN) $(BIN).output lex.yy.c $(BIN).tab.h $(BIN).tab.c $(BIN).tar core

tar:
	tar -cvf $(TARNAME).tar $(SRCS) $(HDRS)  makefile
