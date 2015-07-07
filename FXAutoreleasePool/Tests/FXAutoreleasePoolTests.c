//
//  FXAutoreleasePoolTests.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/2/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <assert.h>

#include "FXTestsMacro.h"
#include "FXAutoreleasePoolTests.h"
#include "FXAutoreleasePool.h"

#pragma mark -
#pragma mark Private Declarations

static
void FXAutoreleasePoolOnePoolTests(void);

static
void FXAutoreleasePoolMultiplePoolsTests(void);

static
void FXAutoreleasePoolMultipleNestedPoolsTests(void);

static
void FXAutoreleasePoolHighLoadTest(void);

#pragma mark -
#pragma mark Public Implementations

extern
void FXAutoreleasePoolTests(void) {
	performTest(FXAutoreleasePoolOnePoolTests);
	performTest(FXAutoreleasePoolMultiplePoolsTests);
	performTest(FXAutoreleasePoolMultipleNestedPoolsTests);
	performTest(FXAutoreleasePoolHighLoadTest);
}

#pragma mark -
#pragma mark Private Implementations

void FXAutoreleasePoolOnePoolTests(void) {
	// ONE POOL, ONE STACK, ONE OBJECT
	
	//	after pool was created
	FXAutoreleasePool *pool = FXAutoreleasePoolCreate();
	
	//	after object was created and additionally retained
	FXObject *object = FXObjectRetain(FXObjectCreate());
	
	//		object reference count must be equal 2
	assert(2 == FXObjectGetReferenceCount(object));
	
	//	after object was added to pool
	FXAutoreleasePoolAddObject(pool, object);
	
	//		retain count for object should not change
	assert(2 == FXObjectGetReferenceCount(object));
	
	//	after pool was drain
	FXAutoreleasePoolDrain(pool);
	
	//		retain count for object must decrease by 1
	assert(1 == FXObjectGetReferenceCount(object));
	
	// release  object
	FXObjectRelease(object);
}

void FXAutoreleasePoolMultiplePoolsTests(void) {
	// MULTIPLE POOLS, MULTIPLE STACKS and MULTIPLE OBJECTS
	
	//	after pool was created
	FXAutoreleasePool *pool = FXAutoreleasePoolCreate();
	
	//	after object was created
	FXObject *object = FXObjectCreate();
	
	//	after retaining and adding object into pool 'many' times
	for (uint64_t counter = 0; counter < 4 * kFXAutoreleasePoolMaxCapacity - 1; counter++) {
		FXObjectRetain(object);
		FXAutoreleasePoolAddObject(pool, object);
	}
	
	//		retain count for object must be equal to 4096 == (4 * kFXAutoreleasePoolMaxCapacity - 1)
	assert(4096 == FXObjectGetReferenceCount(object));
	
	//	after pool was drain
	FXAutoreleasePoolDrain(pool);
	
	//		retain count for object must be equal to 1
	assert(1 == FXObjectGetReferenceCount(object));
	
	//	after pool2 was created
	FXAutoreleasePool *pool2 = FXAutoreleasePoolCreate();
	
	//	after retaining and adding object into pool2 'many' times
	for (uint64_t counter = 0; counter < 2048 * kFXAutoreleasePoolMaxCapacity - 1; counter++) {
		FXObjectRetain(object);
		FXAutoreleasePoolAddObject(pool2, object);
	}
	
	//		retain count for object must be equal to 2097152 == (2048 * kFXAutoreleasePoolMaxCapacity - 1)
	assert(2097152 == FXObjectGetReferenceCount(object));
	
	//	after pool2 was drain
	FXAutoreleasePoolDrain(pool2);
	
	//		retain count for object must be equal to 1
	assert(1 == FXObjectGetReferenceCount(object));
	
	// release object
	FXObjectRelease(object);
}

void FXAutoreleasePoolMultipleNestedPoolsTests(void) {
	// MULTIPLE NESTED POOLS
	
	//	after pool was created
	FXAutoreleasePool *pool = FXAutoreleasePoolCreate();
	
	//	after object was created
	FXObject *object = FXObjectCreate();
	
	//	after retaining and adding object into pool 10 times
	for (uint64_t counter = 0; counter < 10; counter++) {
		FXObjectRetain(object);
		FXAutoreleasePoolAddObject(pool, object);
	}
	
	//		reference count for object should be 11
	assert(11 == FXObjectGetReferenceCount(object));
	
	//	after pool2 was created
	FXAutoreleasePool *pool2 = FXAutoreleasePoolCreate();
	
	//	after retaining and adding object into pool2 8 times
	for (uint64_t counter = 0; counter < 8; counter++) {
		FXObjectRetain(object);
		FXAutoreleasePoolAddObject(pool2, object);
	}
	
	//		reference count for object should be 19
	assert(19 == FXObjectGetReferenceCount(object));
	
	//	after pool3 was created
	FXAutoreleasePool *pool3 = FXAutoreleasePoolCreate();
	
	//	after retaining and adding object into pool3 6 times
	for (uint64_t counter = 0; counter < 6; counter++) {
		FXObjectRetain(object);
		FXAutoreleasePoolAddObject(pool3, object);
	}
	
	//		reference count for object should be 25
	assert(25 == FXObjectGetReferenceCount(object));
	
	//	after pool3 was drain
	FXAutoreleasePoolDrain(pool3);
	
	//		reference count for object should be 19
	assert(19 == FXObjectGetReferenceCount(object));
	
	//	after pool2 was drain
	FXAutoreleasePoolDrain(pool2);
	
	//		reference count for object should be 11
	assert(11 == FXObjectGetReferenceCount(object));
	
	//	after pool was drain
	FXAutoreleasePoolDrain(pool);
	
	// release object
	FXObjectRelease(object);
}

void FXAutoreleasePoolHighLoadTest(void) {
	//	after pool was created
	FXAutoreleasePool *pool = FXAutoreleasePoolCreate();
	
	uint32_t maxCount = UINT16_MAX << 6;
	//	after objects was pushed into pool 'maxCount' times 
	for (uint32_t counter = 0; counter < maxCount; counter++) {
		FXAutoreleasePoolAddObject(pool, FXObjectCreate());
	}
	
	//	after drain pool
	FXAutoreleasePoolDrain(pool);
	
	// do this again
	
	//	create another pool
	pool = FXAutoreleasePoolCreate();
	
	//	after objects was pushed into pool 'maxCount' times 
	for (uint32_t counter = 0; counter < maxCount; counter++) {
		FXAutoreleasePoolAddObject(pool, FXObjectCreate());
	}
	
	//	after drain pool
	FXAutoreleasePoolDrain(pool);
}
