#include "symtab.h"
int SymTab::initMaxTable_=100;

void xPrint(void *p)
{
    printf("0x%08x", p);
}


// constructor
SymTab::SymTab(void (* elemPrint)(void *))
{
    maxTable_ = initMaxTable_;
    table_ = new SymTabEntry[initMaxTable_];
    for (int i=0; i<initMaxTable_; i++) table_[i].name="";
    top_ = table_;
    elemPrint_ = elemPrint;
    scopeDepth_ = 0;
    debug_ = 0x0;
    enter("globals");
};


// destructor
SymTab::~SymTab()
{
    maxTable_ = 0;
    delete table_;
};

// set the debug flags defined in symtab.h
void SymTab::debug(int newDebugValue)
{
    debug_ = newDebugValue;
}

// push the sym and ptr on the stack
void SymTab::push(const char *sym, int scopeDepth, void *ptr)
{
	char *temp;
    // if you run out of memory then add some
    if (top_>=table_+maxTable_) {
	int offset;
	SymTabEntry *newt;

	newt = new SymTabEntry[(maxTable_*13)/8];
	memcpy(newt, table_, sizeof(SymTabEntry)*maxTable_);
	delete table_;

        maxTable_=(maxTable_*13)/8;
	printf("SYMTAB: size fault.  Increase to %d elements\n", maxTable_);
	fflush(stdout);
	offset = top_-table_;
	table_ = newt;
	top_ = newt+offset;

    }
	temp = new char[strlen(sym)];
	strcpy(temp, sym);
    top_->name = temp;
    top_->scope = scopeName_;
    top_->depth = scopeDepth;  // note that this is passed in
    top_->ptr = ptr;
    top_++;
};


// prints the symbol table with each element printed using
// the print routine supplied in the constuctor.  New line is supplied
// by this print routine.
void SymTab::print()
{
    SymTabEntry *p;

    printf("\nSymbol Stack:\n");
    for (p=table_; p<top_; p++) {
	// print a regular entry
	if (p->depth) {
//debug	    printf("%10s %10s %d 0x%08x ", p->name, p->scope, p->depth, p);
	    printf("%10s %10s %d ", p->name, p->scope, p->depth);
	    elemPrint_(p->ptr);
	    printf("\n");
	}
	// print the scope divider
	else {
	    printf("%10s %10s ---- \n", p->name, p->scope);
	}
    }
    fflush(stdout);
};



// inserts an element into the symbol table
bool SymTab::insert(const char *sym, void *ptr)
{
    SymTabEntry *p;

    for (p=top_-1; p->depth; p--) {
	if (strcmp(p->name, sym)==0) return false;
    }

    if (debug_ & DEBUG_PUSH) {
	printf("SymTab: Pushing this node: ");
	elemPrint_(ptr);
	printf("\n");
	fflush(stdout);
    }

    push(sym, scopeDepth_, ptr);
    return true;
};


// lookup the name in the SymTabEntry
// returning the pointer to the thing stored with the symbol
// or NULL if it could not be found
void *SymTab::lookup(const char *sym)
{
    SymTabEntry *p;

    for (p=top_-1; p>=table_; p--) {
	if (strcmp(p->name, sym)==0) {
	    return p->ptr;
	}
    }
    return NULL;
};

void *SymTab::lookupLocal(const char *sym)
{
    SymTabEntry *p;

    for (p=top_-1; p>=table_; p--) {
		if (strcmp(p->scope, scopeName_))
			return NULL;	// do not look past current scope
		if (strcmp(p->name, sym)==0) {
			return p->ptr;
		}
    }
    return NULL;
};


// lookup the entry in the symbol table
SymTabEntry *SymTab::lookupSymTabEntry(const char *sym)
{
    SymTabEntry *p;

    for (p=top_-1; p>=table_; p--) {
	if (strcmp(p->name, sym)==0) {
	    return p;
	}
    }
    return NULL;
};


// create a new scope on the stack
void SymTab::enter(const char *funcname)
{
	char *temp;

    temp = new char[strlen(funcname)];
	strcpy(temp, funcname);
	scopeName_ = temp;
    if (debug_ & DEBUG_TABLE) printf("SymTab: Entering scope %s\n", scopeName_);
    scopeDepth_++;
    push("", 0, NULL);
};


// leave a scope 
bool SymTab::leave()
{
    SymTabEntry *newTop;

    if (debug_ & DEBUG_TABLE) {
	print();
	printf("SymTab: Leaving scope %s\n", scopeName_);
	fflush(stdout);
    }

    newTop = lookupSymTabEntry("");
    if (newTop>table_) {
	top_ = newTop;
	scopeName_ = (top_-1)->scope;
	if (debug_ & DEBUG_TABLE) printf("and entering scope %s\n", scopeName_);
	if (scopeDepth_>1) scopeDepth_--;
	return true;
    }
//debug    printf("ERROR(symbol table): You cannot leave global scope.\n");
    return false;
};


// the depth of the scope stack with the first real scope (probably
// globals) numbered 1
int SymTab::depth()
{
    return scopeDepth_;
}

// number of real entries in the whole table
int SymTab::numEntries()
{
    return (top_-table_)-scopeDepth_-1;
}
