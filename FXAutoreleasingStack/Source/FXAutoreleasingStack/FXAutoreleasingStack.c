//
//  FXAutoreleasingStack.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "FXAutoreleasingStack.h"

#pragma mark -
#pragma mark Private Declarations

struct FXAutoreleasingStack {
	FXObject _super; // inheritance from FXObject
	
	void **_data;
	void *_head;
	size_t _size;
};

static
void **FXAutoreleasingStackGetData(FXAutoreleasingStack *stack);

static
void *FXAutoreleasingStackGetHead(FXAutoreleasingStack *stack);

static
void FXAutoreleasingStackSetHead(FXAutoreleasingStack *stack, void *head);

static
size_t FXAutoreleasingStackGetSize(FXAutoreleasingStack *stack);

static
void FXAutoreleasingStackSetSize(FXAutoreleasingStack *stack, size_t size);

#pragma mark -
#pragma mark Public Implementations

// dealloc
void __FXAutoreleasingStackDeallocate(FXAutoreleasingStack *stack) {
	FXAutoreleasingStackSetSize(stack, 0); // purge all stack by set it size zero
	
	__FXObjectDeallocate(stack);
}

FXAutoreleasingStack *FXAutoreleasingStackCreateWithSize(size_t size) {
	assert(0 != size); // sanity our size
	
	FXAutoreleasingStack *stack = FXObjectCreateOfType(FXAutoreleasingStack);
	FXAutoreleasingStackSetSize(stack, size);
	
	void *head = FXAutoreleasingStackGetData(stack);
	FXAutoreleasingStackSetHead(stack, head);
	
	return stack;
}

void FXAutoreleasingStackPushObject(FXAutoreleasingStack *stack, void *object) {
	if (NULL != stack) {
		assert(false == FXAutoreleasingStackIsFull(stack)); // sanity
		
		void **head = FXAutoreleasingStackGetHead(stack); // get head of stack
		*head = object; // push object to head of stack
		head++; // increase pointer to head (by size of pointer to object)
		
		FXAutoreleasingStackSetHead(stack, head); // set stack new head
	}
}

FXAutoreleasingStackPopType FXAutoreleasingStackPopObject(FXAutoreleasingStack *stack) {
	if (NULL != stack) {
		assert(false == FXAutoreleasingStackIsEmpty(stack)); // sanity
		
		void **head = FXAutoreleasingStackGetHead(stack); // get head of stack
		head--; // decrease pointer to head to get start address of head object (by size of pointer to object)
		void *object = *head; // get object from head
		
		FXAutoreleasingStackSetHead(stack, head); // set new head
		
		FXAutoreleasingStackPopType type;
		if (NULL != object) {
			type = kFXAutoreleasingStackPoppedObject;
		} else {
			type = kFXAutoreleasingStackPoppedNULL;
		}
		
		FXObjectRelease(object);
		
		return type;
	}
	
	return 0;
}

FXAutoreleasingStackPopType FXAutoreleasingStackPopObjectsUntilNULL(FXAutoreleasingStack *stack) {
	if (NULL != stack) {
		assert(false == FXAutoreleasingStackIsEmpty(stack)); // sanity
		
		FXAutoreleasingStackPopType type;
		do { // do pop until objects and stack not empty
			type = FXAutoreleasingStackPopObject(stack);
		} while (kFXAutoreleasingStackPoppedObject == type && false == FXAutoreleasingStackIsEmpty(stack));
		
		return type;
	}
	
	return 0;
}

bool FXAutoreleasingStackIsEmpty(FXAutoreleasingStack *stack) {
	if (NULL != stack) {
		if (FXAutoreleasingStackGetHead(stack) == FXAutoreleasingStackGetData(stack)) { // if pointer to head equals data
			
			return true; // is empty
		}
	}
	
	return false;
}

bool FXAutoreleasingStackIsFull(FXAutoreleasingStack *stack) {
	if (NULL != stack) {
		void **data = FXAutoreleasingStackGetData(stack);
		void *head = FXAutoreleasingStackGetHead(stack);
		
		uint64_t count = FXAutoreleasingStackGetSize(stack) / sizeof(*data);
		
		if ((void *)(&(data[count])) <= head) {
			
			return true; // dbg
		}
	}
	
	return false;
}

#pragma mark -
#pragma mark Private Implementations

void **FXAutoreleasingStackGetData(FXAutoreleasingStack *stack) {
	if (NULL != stack) {
		return stack->_data;
	}
	
	return NULL;
}

void *FXAutoreleasingStackGetHead(FXAutoreleasingStack *stack) {
	if (NULL != stack) {
		return stack->_head;
	}
	
	return NULL;
}

void FXAutoreleasingStackSetHead(FXAutoreleasingStack *stack, void *head) {
	if (NULL != stack) {
		stack->_head = head; // TODO: with assign setter
	}
}

size_t FXAutoreleasingStackGetSize(FXAutoreleasingStack *stack) {
	if (NULL != stack) {
		return stack->_size;
	}
	
	return 0;
}

// used only in create/dealloc
// FIXME: we create our stack with fixed size at once, so re-done it without resize (realloc)?
void FXAutoreleasingStackSetSize(FXAutoreleasingStack *stack, size_t size) {
	if (NULL != stack) {
		size_t previousSize = FXAutoreleasingStackGetSize(stack);
		void **previousData = FXAutoreleasingStackGetData(stack);
		if (previousSize != size) {
			
			if (0 != size) {
				size_t stackSize = size * sizeof(*stack->_data);
				
				if (NULL == previousData) { // create case
					stack->_data = malloc(stackSize);
				} else { // resize case
					stack->_data = realloc(stack->_data, stackSize);
				}
				
				assert(NULL != stack->_data); // make sure allocation is successfull
				
			} else { // dealloc case
				free(stack->_data);
				stack->_data = NULL;
			}
			
			stack->_size = size; // TODO: with assign setter
		}
	}
}
