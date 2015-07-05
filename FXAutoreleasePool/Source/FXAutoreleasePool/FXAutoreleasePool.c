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

static const uint64_t kFXAutoreleasePoolMaxCapacity = 1024;
static const uint64_t kFXAutoreleasePoolMinCount = 2; // count of minimal pools amount

struct FXAutoreleasePool {
	FXObject _super; // inheritance from FXObject
	
	FXLinkedList *_list;
	FXAutoreleasingStack *_currentStack;
};

static FXAutoreleasePool *__pool = NULL; // using singleton

static
FXAutoreleasePool *FXAutoreleasePoolGetPool(void); // get pool

static
void FXAutoreleasePoolSetPool(FXAutoreleasePool *pool); // set pool

static
FXLinkedList *FXAutoreleasePoolGetList(FXAutoreleasePool *pool); // get list

static
void FXAutoreleasePoolSetList(FXAutoreleasePool *pool, FXLinkedList *list); // set list

static
FXAutoreleasingStack *FXAutoreleasePoolGetCurrentStack(FXAutoreleasePool *pool); // get current stack

static
void FXAutoreleasePoolSetCurrentStack(FXAutoreleasePool *pool, FXAutoreleasingStack *stack); // set current stack

#pragma mark -
#pragma mark Public Implementations

// dealloc (just in case)
void __FXAutoreleasePoolDeallocate(FXAutoreleasePool *pool) {
	// singleton: do nothing
}

// FIXME: because we are using singleton, which is never release, rename Create -> Start?
FXAutoreleasePool *FXAutoreleasePoolCreate(void) {
	FXAutoreleasePool *pool = FXAutoreleasePoolGetPool();
	if (NULL == pool) { // first start (init)
		pool = FXObjectCreateOfType(FXAutoreleasePool);
		FXLinkedList *list = FXLinkedListCreate();
		
		FXAutoreleasePoolSetList(pool, list);
		FXAutoreleasePoolSetPool(pool);
		
		FXObjectRelease(list);
	}
	
	FXAutoreleasePoolAddObject(pool, NULL);
	
	return pool;
}

void FXAutoreleasePoolAddObject(FXAutoreleasePool *pool, void *object) {
	
}

void FXAutoreleasePoolDrain(FXAutoreleasePool *pool) {
	
}

#pragma mark -
#pragma mark Private Implementations

FXAutoreleasePool *FXAutoreleasePoolGetPool(void) {
	// singleton: don't NULL check
	return __pool;
}

void FXAutoreleasePoolSetPool(FXAutoreleasePool *pool) {
	if (NULL != pool) {
		__pool = pool;
	}
}

FXLinkedList *FXAutoreleasePoolGetList(FXAutoreleasePool *pool) {
	if (NULL != pool) {
		return pool->_list;
	}
	
	return NULL;
}

void FXAutoreleasePoolSetList(FXAutoreleasePool *pool, FXLinkedList *list) {
	if (NULL != pool) {
		// TODO: do this with retain setter
		FXObjectRetain(list);
		FXObjectRelease(pool->_list);
		
		pool->_list = list;
	}
}

FXAutoreleasingStack *FXAutoreleasePoolGetCurrentStack(FXAutoreleasePool *pool) {
	if (NULL != pool) {
		return pool->_currentStack;
	}
	
	return NULL;
}

void FXAutoreleasePoolSetCurrentStack(FXAutoreleasePool *pool, FXAutoreleasingStack *stack) {
	if (NULL != pool) {
		// TODO: do this with retain setter
		FXObjectRetain(stack);
		FXObjectRelease(pool->_currentStack);
		
		pool->_currentStack = stack;
	}
}
