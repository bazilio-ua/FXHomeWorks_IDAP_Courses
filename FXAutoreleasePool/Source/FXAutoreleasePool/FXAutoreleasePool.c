//
//  FXAutoreleasePool.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/2/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#include "FXAutoreleasePool.h"
#include "FXLinkedList.h"
#include "FXAutoreleasingStack.h"

#pragma mark -
#pragma mark Private Declarations

struct FXAutoreleasePool {
	FXObject _super; // inheritance from FXObject
	
	FXLinkedList *_list;
	FXAutoreleasingStack *_currentStack;
};

static FXAutoreleasePool *__pool = NULL; // using singleton

#pragma mark -
#pragma mark Public Implementations

// dealloc (just in case)
void __FXAutoreleasePoolDeallocate(FXAutoreleasePool *pool) {
	// do nothing
}

FXAutoreleasePool *FXAutoreleasePoolCreate(void) {
	return NULL;
}

void FXAutoreleasePoolAddObject(FXAutoreleasePool *pool, void *object) {
	
}

void FXAutoreleasePoolDrain(FXAutoreleasePool *pool) {
	
}

#pragma mark -
#pragma mark Private Implementations
