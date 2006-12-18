BIN  = c-
TARNAME = cpermann
CC   = g++
CCFLAGS = -DCPLUSPLUS -g  # for use with C++ if file ext is .cc
CFLAGS = -DCPLUSPLUS -g  # for use with C++ if file ext is .c

HDRS = syntaxtree.h symtab.h emitcode.h compiler.h
SRCS = $(BIN).y.cpp syntaxtree.cpp symtab.cpp emitcode.cpp compiler.cpp $(BIN).l.cpp
OBJS = lex.yy.o syntaxtree.o symtab.o emitcode.o compiler.o $(BIN).tab.o
LIBS = -lfl -lm 

.cpp.o:
	$(CC) $(CCFLAGS) -c -o $@ $<

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
	rm -f $(OBJS) $(BIN) $(BIN).output lex.yy.c $(BIN).tab.h $(BIN).tab.c cpermann.tar core

tar:
	tar -cvf $(TARNAME).tar $(SRCS) $(HDRS)  makefile
