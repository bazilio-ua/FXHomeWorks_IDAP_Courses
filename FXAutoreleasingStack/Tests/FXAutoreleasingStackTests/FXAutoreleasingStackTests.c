//
//  FXAutoreleasingStackTests.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#include "FXTestsMacro.h"
#include "FXAutoreleasingStackTests.h"

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
	//		stack must be empty
	//		stack must be not full
	//	after object was created
	//		after object was pushed to the stack
	//			object reference count must not change
	//			stack must be not empry
	//			stack must be not full
	//		after object was popped from the stack
	//			pop type must be 'poppedObject'
	//			object reference count must decrement
	//			stack must be empty
	//			stack must be not full
}

void FXAutoreleasingStackOneNULLPushTest(void) {
	//	after stack was created for 64 objects
	//		stack must be empty
	//		stack must be not full
	//	after NULL pushed to the stack
	//		stack must be not empty
	//		stack must be not full
	//	after one object was popped
	//		pop type must be 'poppedNULL'
	//		stack must be empty
	//		stack must be not full
}

void FXAutoreleasingStackIsFullTest(void) {
	//	after stack was created for 64 objects
	//		stack must be empty
	//		stack must be not full
	//	after object was created
	//		after object pushed to stack 64 times
	//		object reference count must not change
	//		stack must be not empty
	//		stack must be full
	//	after one object was popped
	//		pop type must be 'poppedObject'
	//		object reference count must decrement
	//		stack must be not empty
	//		stack must be not full
	//	after all object was popped
	//		pop type must be 'poppedObject'
	//		object reference count must be decremented 63 times
	//		stack must be empty
	//		stack must be not full
}
