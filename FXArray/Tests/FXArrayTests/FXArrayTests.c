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

static
void FXArrayHighLoadOneObjectPerformanceTest(void);

static
void FXArrayHighLoadMultiplyObjectsPerformanceTest(void);

#pragma mark -
#pragma mark Public Implementation

void FXArrayTests(void) {
	performTest(FXArrayOneObjectBehaviorTest);
	performTest(FXArrayMultiplyObjectBehaviorTest);
	performTest(FXArrayHighLoadOneObjectPerformanceTest);
	performTest(FXArrayHighLoadMultiplyObjectsPerformanceTest);
}

#pragma mark -
#pragma mark Private Implementation

void FXArrayOneObjectBehaviorTest(void) {
	//	after array was created
	FXArray *array = FXArrayCreateWithCapacity(2);
	
	//		array must be not NULL
	assert(NULL != array);
	
	//		array retain count must be equal 1
	assert(1 == FXObjectGetReferenceCount(array));
	
	//		array objects count must be equal 0
	assert(0 == FXArrayGetCount(array));
	
	//	after object was created
	FXObject *object = FXObjectCreateOfType(FXObject);
	
	//		object must not be NULL
	assert(NULL != object);
	
	//		object reference count must be equal to 1
	assert(1 == FXObjectGetReferenceCount(object));
	//		object index in array must be invalid (object not found)
	assert(false == FXArrayContainsObject(array, object));
	
	//	after object was added to array
	FXArrayAddObject(array, object);
	
	//		array count must be equal to 1
	assert(1 == FXArrayGetCount(array));
	
	//		array reference count must not change
	assert(1 == FXObjectGetReferenceCount(array));
	
	//		object index in array must be equal 0
	assert(0 == FXArrayGetIndexOfObject(array, object));
		   
	//		object reference count must be incremented by 1 (equal to 2)
	assert(2 == FXObjectGetReferenceCount(object));
	
	//		array object at index 0 must be equal to added object
	assert(object == FXArrayGetObjectAtIndex(array, 0));
	
	//		array must contain object
	assert(true == FXArrayContainsObject(array, object));
	
	//	after object was removed from array
	FXArrayRemoveObjectAtIndex(array, 0);
	
	//		array count must be equal to 0
	assert(0 == FXArrayGetCount(array));
	
	//		array reference count must not change (equal to 1)
	assert(1 == FXObjectGetReferenceCount(array));
	
	//		object index in array must be invalid (object not found)
	assert(kFXIndexNotFound == FXArrayGetIndexOfObject(array, object));
	
	//		object reference count must be decremented by 1 (equal 1)
	assert(1 == FXObjectGetReferenceCount(object));
	
	//		array must not contain an object
	assert(false == FXArrayContainsObject(array, object));
	
	FXObjectRelease(object);
	FXObjectRelease(array);
}

void FXArrayMultiplyObjectBehaviorTest(void) {
	FXArray *array = FXArrayCreateWithCapacity(10); // create test array
	FXObject *object = FXObjectCreateOfType(FXObject); // create test origin object
	
	//	after one origin object was added 5 times in array
	for (uint64_t count = 0; count < 5; count++) {
		FXArrayAddObject(array, object);
	}
	
	//		array count must be equal to 5
	assert(5 == FXArrayGetCount(array));
	
	//		objects at indices 0 - 4 must be equal to object
	for (uint64_t index = 0; index < 5; index++) {
		assert(object == FXArrayGetObjectAtIndex(array, index));
	}
	
	FXObject *object2 = FXObjectCreateOfType(FXObject); // create test object2
	
	//	after added another object2 (not equal to origin object)
	FXArrayAddObject(array, object2);
	
	//		array count must be equal to 6
	assert(6 == FXArrayGetCount(array));
	
	//		objects at indices 0 - 4 must be equal to origin object
	for (uint64_t index = 0; index < 5; index++) {
		assert(object == FXArrayGetObjectAtIndex(array, index));
	}
	
	//		added object2 must be at index 5
	assert(5 == FXArrayGetIndexOfObject(array, object2));
	
	//	after object at index 3 was removed
	FXArrayRemoveObjectAtIndex(array, 3);
	
	//		array count must be equal to 5
	assert(5 == FXArrayGetCount(array));
	
	//		objects at indices 0 - 3 must be equal to origin object
	for (uint64_t index = 0; index < 4; index++) {
		assert(object == FXArrayGetObjectAtIndex(array, index));
	}
	
	//		added object2 must be at index 4
	assert(object2 == FXArrayGetObjectAtIndex(array, 4));
	
	//	after removing all objects from array
	FXArrayRemoveAllObjects(array);
	
	//		array must be empty
	assert(0 == FXArrayGetCount(array));
	
	//		array must no contain origin object and object2
	assert(false == FXArrayContainsObject(array, object));
	assert(false == FXArrayContainsObject(array, object2));
	
	//		array capacity should be equal 0
	assert(0 == FXArrayGetCapacity(array));
	
	FXObject *object3 = FXObjectCreateOfType(FXObject); // create test object3
	
	//	after one origin object was added 5 times in array
	for (uint64_t count = 0; count < 5; count++) {
		FXArrayAddObject(array, object);
	}
	
	//	after one object2 was added 5 times in array
	for (uint64_t count = 5; count < 10; count++) {
		FXArrayAddObject(array, object2);
	}
	
	//	after one object3 was added 5 times in array
	for (uint64_t count = 10; count < 15; count++) {
		FXArrayAddObject(array, object3);
	}
	
	//		array count must be equal to 15
	assert(15 == FXArrayGetCount(array));
	
	printf("array has capacity: %llu and count: %llu\n", FXArrayGetCapacity(array), FXArrayGetCount(array));
	
	//	after removing all instances of object2
	FXArrayRemoveAllInstancesOfObject(array, object2);
	
	//		array count must be equal to 10
	assert(10 == FXArrayGetCount(array));
	
	//		array must no contain object2
	assert(false == FXArrayContainsObject(array, object2));
	
	//	after removing a first instance of object3
	FXArrayRemoveFirstInstanceOfObject(array, object3);
	
	//		array count must be equal to 9
	assert(9 == FXArrayGetCount(array));
	
	//		array must contain other instances of object3
	assert(true == FXArrayContainsObject(array, object3));
	
	//	after removing all objects from array
	FXArrayRemoveAllObjects(array);
	
	//		array must be empty
	assert(0 == FXArrayGetCount(array));
	
	//		array must no contain origin object, object2 and object3
	assert(false == FXArrayContainsObject(array, object));
	assert(false == FXArrayContainsObject(array, object2));
	assert(false == FXArrayContainsObject(array, object3));
	
	//		array capacity should be equal 0
	assert(0 == FXArrayGetCapacity(array));
	
	// release them
	FXObjectRelease(object3);
	FXObjectRelease(object2);
	FXObjectRelease(object);
	FXObjectRelease(array);
}

void FXArrayHighLoadOneObjectPerformanceTest(void) {
	//	after array was created
	FXArray *array = FXArrayCreateWithCapacity(0);
	
	//	after object was created
	FXObject *object = FXObjectCreateOfType(FXObject);
	
	const uint64_t kFXCount = 200000;
	//	add one object 'kFXCount' times in array
	for (uint64_t index = 0; index < kFXCount; index++) {
		FXArrayAddObject(array, object);
	}
	
	//		reference count of added object must be equal 'kFXCount'+1
	assert((kFXCount + 1) == FXObjectGetReferenceCount(object));
	
	//		array count must be equal 'kFXCount'
	assert(kFXCount == FXArrayGetCount(array));
	
	//	remove one object 'kFXCount' times from array
	for (uint64_t index = kFXCount; index > 0; --index) {
		FXArrayRemoveObjectAtIndex(array, index - 1);
	}
	
	//		after removing all objects from array its count must be equal to 0
	assert(0 == FXArrayGetCount(array));
	
	// release them
	FXObjectRelease(object);
	FXObjectRelease(array);
}

void FXArrayHighLoadMultiplyObjectsPerformanceTest(void) {
	//	after array was created
	FXArray *array = FXArrayCreateWithCapacity(0);
	
	const uint64_t kFXCount = 200000;
	//	add 'kFXCount's objects in array
	for (uint64_t index = 0; index < kFXCount; index++) {
		//	after object was created
		FXObject *object = FXObjectCreateOfType(FXObject);
		
		//		add it to array 'kFXCount' times
		FXArrayAddObject(array, object);
		
		//	release object 'kFXCount' times
		FXObjectRelease(object);
	}
	
	//	array count must be equal 'kFXCount'
	assert(kFXCount == FXArrayGetCount(array));
	
	//	object at index[0] in array must not be equal to object at index[1] 
	assert(FXArrayGetObjectAtIndex(array, 0) != FXArrayGetObjectAtIndex(array, 1));

	//	object at index[1] in array must not be equal to object at index['kFXCount'-1] 
	assert(FXArrayGetObjectAtIndex(array, 1) != FXArrayGetObjectAtIndex(array, kFXCount - 1));

	//	remove object at index[0] (all 'kFXCount'-1 objects should shift to left)
	FXArrayRemoveObjectAtIndex(array, 0);
	
	//	remove 'kFXCount'-1 objects from array
	for (uint64_t index = kFXCount - 1; index > 0; --index) {
		FXArrayRemoveObjectAtIndex(array, index - 1);
	}
	
	//	after removing all objects from array its count must be equal to 0
	assert(0 == FXArrayGetCount(array));
	
	//	array capacity should be equal to 0
	assert(0 == FXArrayGetCapacity(array));
	
	// release array
	FXObjectRelease(array);
}
