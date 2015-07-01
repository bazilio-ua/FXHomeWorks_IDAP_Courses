//
//  FXObjectTests.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/16/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <assert.h>

#include "FXTestsMacro.h"
#include "FXObjectTests.h"
#include "FXObject.h"

#pragma mark -
#pragma mark Private Declaration

static
void FXObjectAllocationsTests(void);

#pragma mark -
#pragma mark Public Implementation

void FXObjectTests(void) {
	performTest(FXObjectAllocationsTests);
}

#pragma mark -
#pragma mark Private Implementation

void FXObjectAllocationsTests(void) {
	// create an object
	void *object = FXObjectCreate();
	
	// after creation pointer to object should not be NULL
	assert(NULL != object);
	
	// reference count for object should be equal 1
	assert(1 == FXObjectGetReferenceCount(object));
	
	// after retain object
	object = FXObjectRetain(object);
	
	// reference count for object should be equal 2
	assert(2 == FXObjectGetReferenceCount(object));

	// after release object
	FXObjectRelease(object);

	// reference count for object should be equal 1
	assert(1 == FXObjectGetReferenceCount(object));

	// after release object
	FXObjectRelease(object);

	// reference count for object should be equal 0 (object was freed)
	assert(0 == FXObjectGetReferenceCount(object));
	
	// release it
	FXObjectRelease(object);
}
