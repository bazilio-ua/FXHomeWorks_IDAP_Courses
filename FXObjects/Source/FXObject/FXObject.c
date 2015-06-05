//
//  FXObject.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/16/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "FXObject.h"

#pragma mark -
#pragma mark Public Implementation

void __FXObjectDeallocate(void *object) {
	free(object);
}

void *__FXObjectCreate(size_t objectSize, FXObjectDeallocatorCallback deallocateCallback) {
	assert(objectSize != 0); // sanity size
	
	FXObject *object = calloc(1, objectSize);
	
	assert(object != NULL); // sanity object alloc
	
	object->_referenceCount = 1;
	object->_deallocator = deallocateCallback;
	
	return object;
}

void *FXObjectRetain(void *object) {
	if (object != NULL) {
		((FXObject *)object)->_referenceCount++;
	}
	
	return object;
}

void FXObjectRelease(void *object) {
	if (object != NULL) {
		if (--((FXObject *)object)->_referenceCount == 0) {
			((FXObject *)object)->_deallocator(object); // call dealloc if our obj is not used by anyone
		}
	}
}

uint64_t FXObjectGetReferenceCount(void *object) {
	if (object != NULL) {
		return ((FXObject *)object)->_referenceCount;
	}
	
	return 0;
}
