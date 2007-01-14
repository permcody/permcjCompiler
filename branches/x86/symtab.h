/*	$Author$
	$Date$
	$Rev$
*/

#ifndef _SYMTAB_H_
#define _SYMTAB_H_

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define DEBUG_PUSH 0x1
#define DEBUG_TABLE 0x2

typedef struct {
    char *name;
    char *scope;
    int depth;
    void *ptr;
} SymTabEntry;
    

// 
// Class SymTab
// 
// A general simple stack of symbol tables that maps 
// a char * to a void *.  Provides a user definable
// print routine for the objects stored in the symbol table.
// The print rouinte is defined when the constructor is called.
// 
// debug flags setable by the debug method:
//   DEBUG_TABLE - announce entry to a scope and prints the symbol
//       table on exit from a scope.
//   DEBUG_PUSH - print everything that is pushed on the stack (uses
//       the print routine for printing the ptr value (treeNode *?)
// these flags are bit masks and so can be ored together to turn
// on multiple affects.  For example debug(DEBUG_TABLE | DEBUG_PUSH) would
// turn on both the DEBUG_PUSH and DEBUG_TABLE flags.
//
//  The four most important operations are insert, lookup, enter, leave.
//

class SymTab 
{
    // static data
    private:
    static int initMaxTable_;   // this is the initial size of the symbol table

    // data
    private:
        int maxTable_;          // this is how big the table is now since it can grow
        SymTabEntry *table_;    // the table is simply a fancy stack of SymTabEntries
        SymTabEntry *top_;      // this is where the next new data will be added
        char *scopeName_;       // this is the current scope name
        int scopeDepth_;        // this is the currect depth of the scopes
        void (* elemPrint_)(void *);  // this is a print routine to print your TreeNode *
	int debug_;             // this holds debug flags defined above
	
    // methods
    public:
	// symbol table         
        SymTab(void (* elemPrint)(void *));  // the constructor creates and sets the print routine
	~SymTab();                           // destructor
	void debug(int newDebugValue);       // sets the debug flags
	void print();                        // prints the entire stack
	bool insert(const char *sym, void *ptr);   // inserts a new ptr associated with symbol sym 
                                             // returns false if already defined
	void *lookup(const char *sym);             // returns the ptr associated with sym
                                             // returns NULL if symbol not found
	void *lookupLocal(const char *sym);		   // same as lookup but only local scope
	SymTabEntry *lookupSymTabEntry(const char *sym);  // returns pointer to SymTabEntry associated with sym
                                             // returns NULL if symbol not found

        // scope functions
	void enter(const char *funcname);          // enter a function named funcname
	bool leave();                        // leave that function
        int numEntries();                    // number of entries (more for debugging)
        int depth();                         // depth of scopes on stack (useful in later assignment)
	void push(const char *sym, int scopeDepth, void *ptr);  // really should be private
};

#endif
