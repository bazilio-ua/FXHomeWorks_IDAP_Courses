//
//  FXAutoreleasePool.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/2/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <assert.h>

#include "FXAutoreleasePool.h"
#include "FXLinkedList.h"
#include "FXLinkedListEnumeratorPrivate.h"
#include "FXAutoreleasingStack.h"

#pragma mark -
#pragma mark Private Declarations

const uint64_t kFXAutoreleasePoolMaxCapacity = 1024;
static const uint64_t kFXAutoreleasePoolMinCount = 2; // count of minimal pools amount

struct FXAutoreleasePool {
	FXObject _super; // inheritance from FXObject
	
	FXLinkedList *_list;
	FXAutoreleasingStack *_currentStack;
	uint64_t _emptyStacksCount;
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

// get empty stack
static
FXAutoreleasingStack *FXAutoreleasePoolGetEmptyStack(FXAutoreleasePool *pool);

static
void FXAutoreleasePoolSetEmptyStacksCount(FXAutoreleasePool *pool, uint64_t count);

static
uint64_t FXAutoreleasePoolGetEmptyStacksCount(FXAutoreleasePool *pool);

static
void FXAutoreleasePoolDeflateIfNeeded(FXAutoreleasePool *pool);

static
void FXAutoreleasePoolDeflate(FXAutoreleasePool *pool);

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
		FXAutoreleasePoolSetPool(pool);
		
		FXLinkedList *list = FXLinkedListCreate();
		FXAutoreleasePoolSetList(pool, list);
		
		FXObjectRelease(list);
	}
	
	FXAutoreleasePoolAddObject(pool, NULL);
	
	return pool;
}

void FXAutoreleasePoolAddObject(FXAutoreleasePool *pool, void *object) {
	if (NULL != pool) {
		FXAutoreleasingStack *currentStack = FXAutoreleasePoolGetCurrentStack(pool);
		
		if (NULL == currentStack || true == FXAutoreleasingStackIsFull(currentStack)) {
			FXAutoreleasingStack *previousStack = FXAutoreleasePoolGetEmptyStack(pool);
			if (NULL != previousStack) {
				FXAutoreleasePoolSetCurrentStack(pool, previousStack);
			} else {
				FXLinkedList *list = FXAutoreleasePoolGetList(pool);
				FXAutoreleasingStack *nextStack = FXAutoreleasingStackCreateWithSize(kFXAutoreleasePoolMaxCapacity);
				FXLinkedListAddObject(list, nextStack);
				FXAutoreleasePoolSetCurrentStack(pool, nextStack);
				
				FXObjectRelease(nextStack);
			}
		}
		
		currentStack = FXAutoreleasePoolGetCurrentStack(pool); // renew current stack
		assert(NULL != currentStack); // sanity to avoiding pushing object into NULL stack
		
		FXAutoreleasingStackPushObject(currentStack, object);
	}
}

void FXAutoreleasePoolDrain(FXAutoreleasePool *pool) {
	if (NULL != pool) {
		FXAutoreleasingStack *currentStack = FXAutoreleasePoolGetCurrentStack(pool);
		FXAutoreleasingStackPopType popType = kFXAutoreleasingStackPoppedNULL;
		FXLinkedList *list = FXAutoreleasePoolGetList(pool);
		
		do {
			popType = FXAutoreleasingStackPopObjectsUntilNULL(currentStack);
			if (kFXAutoreleasingStackPoppedObject == popType) {
				currentStack = FXLinkedListGetObjectAfterObject(list, currentStack);
				FXAutoreleasePoolSetCurrentStack(pool, currentStack);
				
				uint64_t count = FXAutoreleasePoolGetEmptyStacksCount(pool) + 1;
				FXAutoreleasePoolSetEmptyStacksCount(pool, count);
			}
			
		} while (kFXAutoreleasingStackPoppedNULL != popType);
		
		FXAutoreleasePoolDeflateIfNeeded(pool);
	}
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

// get empty stack
FXAutoreleasingStack *FXAutoreleasePoolGetEmptyStack(FXAutoreleasePool *pool) {
	if (NULL != pool) {
		FXLinkedList *list = FXAutoreleasePoolGetList(pool);
		FXAutoreleasingStack *currentStack = FXAutoreleasePoolGetCurrentStack(pool);
		uint64_t count = FXAutoreleasePoolGetEmptyStacksCount(pool);
		if (0 < count) { // if we have empty stacks
			FXAutoreleasingStack *previousStack = FXLinkedListGetObjectBeforeObject(list, currentStack);
			assert(true == FXAutoreleasingStackIsEmpty(previousStack)); // sanity check if this is really empty
			
			FXAutoreleasePoolSetEmptyStacksCount(pool, count - 1);
			
			return previousStack;
		}
	}
	
	return NULL;
}

void FXAutoreleasePoolSetEmptyStacksCount(FXAutoreleasePool *pool, uint64_t count) {
	if (NULL != pool) {
		pool->_emptyStacksCount = count;
	}
}

uint64_t FXAutoreleasePoolGetEmptyStacksCount(FXAutoreleasePool *pool) {
	if (NULL != pool) {
		return pool->_emptyStacksCount;
	}
	
	return 0;
}

void FXAutoreleasePoolDeflateIfNeeded(FXAutoreleasePool *pool) {
	if (NULL != pool) {
		if (FXAutoreleasePoolGetEmptyStacksCount(pool) > kFXAutoreleasePoolMinCount) {
			FXAutoreleasePoolDeflate(pool);
		}
	}
}

void FXAutoreleasePoolDeflate(FXAutoreleasePool *pool) {
	if (NULL != pool) {
		FXLinkedList *list = FXAutoreleasePoolGetList(pool);
		uint64_t deflateStacksCount = FXAutoreleasePoolGetEmptyStacksCount(pool) - kFXAutoreleasePoolMinCount;
		for (uint64_t count = 0; count < deflateStacksCount + 1; count++) {
			FXLinkedListRemoveFirstObject(list);
		}
		
		FXAutoreleasePoolSetEmptyStacksCount(pool, kFXAutoreleasePoolMinCount - 1);
	}
}
