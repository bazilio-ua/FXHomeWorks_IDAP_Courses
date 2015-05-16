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
	void *testObject = FXObjectCreateOfType(FXObject);
	
	assert(testObject != NULL);
	
	printf("object '%p' was created, reference count is: %llu\n", testObject, FXObjectGetReferenceCount(testObject));
	
	testObject = FXObjectRetain(testObject);
	
	printf("object '%p' was retained, reference count is: %llu\n", testObject, FXObjectGetReferenceCount(testObject));
	
	FXObjectRelease(testObject);
	
	printf("object '%p' was released, reference count is: %llu\n", testObject, FXObjectGetReferenceCount(testObject));
	
	FXObjectRelease(testObject);
	
	printf("object '%p' was freed, reference count is: %llu\n", testObject, FXObjectGetReferenceCount(testObject)); // at this point object should be freed
	
}
