//
//  FXArrayTests.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/7/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <assert.h>

#include "FXTestsMacro.h"
#include "FXArrayTests.h"
#include "FXArray.h"

#pragma mark -
#pragma mark Private Declaration

static
void FXArrayOneObjectBehaviorTest(void);

static
void FXArrayMultiplyObjectBehaviorTest(void);

#pragma mark -
#pragma mark Public Implementation

void FXArrayTests(void) {
	performTest(FXArrayOneObjectBehaviorTest);
	performTest(FXArrayMultiplyObjectBehaviorTest);
}

#pragma mark -
#pragma mark Private Implementation

void FXArrayOneObjectBehaviorTest(void) {
	//	after one object was created
	//		array must be not NULL
	//		array retain count must be equal 1
	//		array objects count must be equal 0
	//	after object was created
	//		object must not be NULL
	//		object reference count must be equal to 1
	//		object index in array must be invalid (object not found)
	//	after object was added to array
	//		array count must be equal to 1
	//		array reference count must not change
	//		object index in array must be equal 0
	//		object reference count must be incremented by 1 (equal to 2)
	//		array object at index 0 must be equal to added object
	//		array must contain object
	//	after object was removed from array
	//		array count must be equal to 0
	//		array reference count must not change (equal to 1)
	//		object index in array must be invalid (object not found)
	//		object reference count must be decremented by 1 (equal 1)
	//		array must not contain an object
}

void FXArrayMultiplyObjectBehaviorTest(void) {
	//	after one origin object was added 5 times in array
	//		array count must be equal to 5
	//		objects at indices 0 - 4 must be equal to object
	//	after added another object2 (not equal to origin object)
	//		array count must be equal to 6
	//		objects at indices 0 - 4 must be equal to origin object
	//		added object2 must be at index 5
	//	after object at index 3 was removed
	//		array count must be equal to 5
	//		objects at indices 0 - 3 must be equal to origin object
	//		added object2 must be at index 4
	//	after removing all objects from array
	//		array must be empty
	//		array must no contain origin object and object2
}
