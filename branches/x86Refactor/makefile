#	$Author$
#	$Date$
#	$Rev$

BIN  = c-
TARNAME = cpermann
CC   = g++
CCFLAGS = -DCPLUSPLUS -g -Wall  # for use with C++ if file ext is .cc
CFLAGS = -DCPLUSPLUS -g -Wall # for use with C++ if file ext is .c

HDRS = globals.h symtab.h emitcode.h compiler.h
SRCS = $(BIN).y.cpp globals.cpp symtab.cpp emitcode.cpp compiler.cpp $(BIN).l.cpp expression.cpp statement.cpp declaration.cpp
OBJS = lex.yy.o globals.o symtab.o emitcode.o compiler.o expression.o statement.o declaration.o $(BIN).tab.o
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
