//
//  FXAutoreleasingStackTests.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <assert.h>

#include "FXTestsMacro.h"
#include "FXAutoreleasingStackTests.h"
#include "FXAutoreleasingStack.h"

#pragma mark -
#pragma mark Private Declarations

static
void FXAutoreleasingStackOneObjectPushTests(void);

static
void FXAutoreleasingStackOneNULLPushTest(void);

static
void FXAutoreleasingStackIsFullTest(void);

#pragma mark -
#pragma mark Public Implementations

void FXAutoreleasingStackTests(void) {
	performTest(FXAutoreleasingStackOneObjectPushTests);
	performTest(FXAutoreleasingStackOneNULLPushTest);
	performTest(FXAutoreleasingStackIsFullTest);
}

#pragma mark -
#pragma mark Private Implementations

void FXAutoreleasingStackOneObjectPushTests(void) {
	//	after stack was created with size 512 (64 *pointers on it)
	FXAutoreleasingStack *stack = FXAutoreleasingStackCreateWithSize(64 * sizeof(FXObject *));
	
	//		stack must be empty
	assert(true == FXAutoreleasingStackIsEmpty(stack));
	
	//		stack must be not full
	assert(false == FXAutoreleasingStackIsFull(stack));
	
	//	after object was created and additionally retained
	FXObject *object = FXObjectRetain(FXObjectCreateOfType(FXObject));
	
	//		object reference count must be equal to 2
	assert(2 == FXObjectGetReferenceCount(object));
	
	//		after object was pushed to the stack
	FXAutoreleasingStackPushObject(stack, object);
	
	//			object reference count must not change
	assert(2 == FXObjectGetReferenceCount(object));
	
	//			stack must be not empty
	assert(false == FXAutoreleasingStackIsEmpty(stack));
	
	//			stack must be not full
	assert(false == FXAutoreleasingStackIsFull(stack));
	
	//		after object was popped from the stack
	FXAutoreleasingStackPopType type = FXAutoreleasingStackPopObject(stack);
	
	//			pop type must be 'poppedObject'
	assert(kFXAutoreleasingStackPoppedObject == type);
	
	//			object reference count must decrement
	assert(1 == FXObjectGetReferenceCount(object));
	
	//			stack must be empty
	assert(true == FXAutoreleasingStackIsEmpty(stack));
	
	//			stack must be not full
	assert(false == FXAutoreleasingStackIsFull(stack));
	
	// release them
	FXObjectRelease(object);
	FXObjectRelease(stack);
}

void FXAutoreleasingStackOneNULLPushTest(void) {
	//	after stack was created with size 512 (64 *pointers on it)
	FXAutoreleasingStack *stack = FXAutoreleasingStackCreateWithSize(64 * sizeof(FXObject *));
	
	//		stack must be empty
	assert(true == FXAutoreleasingStackIsEmpty(stack));
	
	//		stack must be not full
	assert(false == FXAutoreleasingStackIsFull(stack));
	
	//	after NULL pushed to the stack
	FXAutoreleasingStackPushObject(stack, NULL);
	
	//		stack must be not empty
	assert(false == FXAutoreleasingStackIsEmpty(stack));
	
	//		stack must be not full
	assert(false == FXAutoreleasingStackIsFull(stack));
	
	//	after one object was popped
	FXAutoreleasingStackPopType type = FXAutoreleasingStackPopObject(stack);
	
	//		pop type must be 'poppedNULL'
	assert(kFXAutoreleasingStackPoppedNULL == type);
	
	//		stack must be empty
	assert(true == FXAutoreleasingStackIsEmpty(stack));
	
	//		stack must be not full
	assert(false == FXAutoreleasingStackIsFull(stack));
	
	// release stack
	FXObjectRelease(stack);
}

void FXAutoreleasingStackIsFullTest(void) {
	//	after stack was created for 64 objects
	FXAutoreleasingStack *stack = FXAutoreleasingStackCreateWithSize(64 * sizeof(FXObject *));
	
	//		stack must be empty
	assert(true == FXAutoreleasingStackIsEmpty(stack));
	
	//		stack must be not full
	assert(false == FXAutoreleasingStackIsFull(stack));
	
	//	after object was created
	FXObject *object = FXObjectCreateOfType(FXObject);
	
	//		object reference count must be equal to 1
	assert(1 == FXObjectGetReferenceCount(object));
	
	//		after object was retained and pushed to stack 64 times
	for (uint64_t counter = 0; counter < 64; counter++) {
		FXObjectRetain(object);
		FXAutoreleasingStackPushObject(stack, object);
	}
	
	//		object reference count must be equal 65
	assert(65 == FXObjectGetReferenceCount(object));
	
	//		stack must be not empty
	assert(false == FXAutoreleasingStackIsEmpty(stack));
	
	//		stack must be full
	assert(true == FXAutoreleasingStackIsFull(stack));
	
	//	after one object was popped
	FXAutoreleasingStackPopType type = FXAutoreleasingStackPopObject(stack);
	
	//		pop type must be 'poppedObject'
	assert(kFXAutoreleasingStackPoppedObject == type);
	
	//		object reference count must decrement by 1
	assert(64 == FXObjectGetReferenceCount(object));
	
	//		stack must be not empty
	assert(false == FXAutoreleasingStackIsEmpty(stack));
	
	//		stack must be not full
	assert(false == FXAutoreleasingStackIsFull(stack));
	
	//	after all object was popped
	type = FXAutoreleasingStackPopObjectsUntilNULL(stack);
	
	//		pop type must be 'poppedObject'
	assert(kFXAutoreleasingStackPoppedObject == type);
	
	//		object reference count must be decremented 63 times
	assert(1 == FXObjectGetReferenceCount(object));
	
	//		stack must be empty
	assert(true == FXAutoreleasingStackIsEmpty(stack));
	
	//		stack must be not full
	assert(false == FXAutoreleasingStackIsFull(stack));
	
	// release them
	FXObjectRelease(object);
	FXObjectRelease(stack);
}
