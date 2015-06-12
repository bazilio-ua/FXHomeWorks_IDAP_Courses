//
//  FXArray.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/7/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "FXArray.h"

#pragma mark -
#pragma mark Private Declaration

static const uint64_t kFXIndexNotFound = UINT64_MAX;
static const uint64_t kFXArrayMaxCapacity = kFXIndexNotFound - 1;

struct FXArray {
	FXObject _super; // inheritance from FXObject
	
	void **_data;
	uint64_t _capacity;
	uint64_t _count;
};

#pragma mark -
#pragma mark Public Methods Implementation

// dealloc
void __FXArrayDeallocate(FXArray *array) {
	FXArrayRemoveAllObjects(array);
	
	__FXObjectDeallocate(array);
}

FXArray *FXArrayCreateWithCapacity(uint64_t capacity) {
	FXArray *array = FXObjectCreateOfType(FXArray);
	FXArraySetCapacity(array, capacity);
	
	return array;
}

void FXArraySetCapacity(FXArray *array, uint64_t capacity) {
	if (NULL != array && array->_capacity != capacity) {
		assert(kFXArrayMaxCapacity >= capacity); // sanity
		
		size_t size = capacity * sizeof(*array->_data);
		if (0 != size) { // set new capacity or resize
			if (NULL == array->_data) {
				array->_data = malloc(size); // new alloc
			} else {
				array->_data = realloc(array->_data, size); // re-alloc
			}
			assert(NULL != array->_data); // make sure allocation is successfull
			
		} else if (0 == size && NULL != array->_data) { // remove all objects or dealloc
			free(array->_data);
			array->_data = NULL;
		}
		
		array->_capacity = capacity;
	}
}

uint64_t FXArrayGetCapacity(FXArray *array) {
	if (NULL != array && NULL != array->_data) {
		return array->_capacity;
	}
	
	return 0;
}

void FXArraySetArray(FXArray *array, void **data) {
	if (NULL != array) {
		array->_data = data;
	}
}

void **FXArrayGetArray(FXArray *array) {
	if (NULL != array) {
		return array->_data;
	}
	
	return NULL;
}

uint64_t FXArrayProposedCapacity(FXArray *array) {
	if (NULL != array) {
		uint64_t capacity = FXArrayGetCapacity(array);
		uint64_t count = FXArrayGetCount(array);
		
		uint64_t newCapacity;
		if (capacity > count) { // trim our array
			newCapacity = count;
		} else if (capacity == count) { // do nothing
			newCapacity = capacity;
		} else { // increase its size
			newCapacity = (count * 3) / 2 + 1; // or just [count * 2] ?
		}
		
		return newCapacity;
	}
	
	return 0;
}

bool FXArrayShouldResize(FXArray *array) {
	if (NULL != array) {
		if (array->_capacity != FXArrayProposedCapacity(array)) {
			return true;
		}
	}
	return false;
}

void FXArrayResizeIfNeeded(FXArray *array) {
	if (FXArrayShouldResize(array)) {
		FXArraySetCapacity(array, FXArrayProposedCapacity(array));
	}
}

void FXArraySetCount(FXArray *array, uint64_t count) {
	if (NULL != array) {
		assert(kFXArrayMaxCapacity >= count); // sanity
		
		array->_count = count;
		
		FXArrayResizeIfNeeded(array);
	}
}

uint64_t FXArrayGetCount(FXArray *array) {
	if (NULL != array) {
		return array->_count;
	}
	
	return 0;
}

void FXArrayAddObject(FXArray *array, void *object) {
	
}

void FXArrayRemoveObject(FXArray *array, void *object) {
	
}

bool FXArrayContainsObject(FXArray *array, void *object) {
	return false;
}

uint64_t FXArrayGetIndexOfObject(FXArray *array, void *object) {
	return 0;
}

void FXArraySetObjectAtIndex(FXArray *array, void *object, uint64_t index) {
	
}

FXArray *FXArrayGetObjectAtIndex(FXArray *array, uint64_t index) {
	return NULL;
}

void FXArrayRemoveObjectAtIndex(FXArray *array, uint64_t index) {
	
}

void FXArrayRemoveAllObjects(FXArray *array) {
	
}

#pragma mark -
#pragma mark Private Accessors Implementation
