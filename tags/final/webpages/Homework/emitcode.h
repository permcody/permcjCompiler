#ifndef EMIT_CODE_H__
#define EMIT_CODE_H__

//
//  Special register defines for optional use in calling the 
//  routines below.
//

#define gp   0	//  The global pointer
#define fp   1	//  The local frame pointer
#define rt   2	//  Return value
#define pc   7	//  The program counter

//
//  Accumulator registers
//

#define ac   3
#define ac1  4
#define ac2  5
#define ac3  6


//
//  No comment please...
//

#define NO_COMMENT ""


//
//  We always trace the code
//
#define TraceCode   1

//
//  The following functions were borrowed from Tiny compiler code generator
//

void emitComment2(char *c, char *cc);
void emitComment(char *c);

void emitRO2(char *op, int r, int s, int t, char *c, char *cc);
void emitRO(char *op, int r, int s, int t, char *c);

void emitRM2(char *op, int r, int d, int s, char *c, char *cc);
void emitRM(char *op, int r, int d, int s, char *c);

void emitRMAbs2(char *op, int r, int a, char *c, char *cc);
void emitRMAbs(char *op, int r, int a, char *c);

int emitSkip(int howMany);
void emitBackup(int loc);
void emitRestore(void);

#endif
