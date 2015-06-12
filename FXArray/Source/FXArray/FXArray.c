//
//  FXArray.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/7/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
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
		
/*		uint64_t oldCapacity = array->_capacity;
		if (capacity > oldCapacity) { // if we increase our capacity
			void *newBlock = array->_data[oldCapacity];
//			void *newBlock = array->_data + oldCapacity;
			size_t newBlockSize = (capacity - oldCapacity) * sizeof(*array->_data);
			
			memset(newBlock, 0, newBlockSize); // zeroing new allocated block
		}
*/		
		uint64_t oldCapacity = array->_capacity;
		if (capacity > oldCapacity) { // if we increase our capacity
			size_t size = (capacity - oldCapacity) * sizeof(*array->_data);
			memset(&array->_data[oldCapacity], 0, size); // zeroing new allocated block
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

void FXArraySetData(FXArray *array, void **data) {
	if (NULL != array) {
		array->_data = data;
	}
}

void **FXArrayGetData(FXArray *array) {
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
	if (NULL != array && NULL != object) {
		uint64_t count = FXArrayGetCount(array); // get current count
		FXArraySetCount(array, count + 1); // increase it
		FXArraySetObjectAtIndex(array, object, count); // place our new object to new count index
	}
}

void FXArrayRemoveObject(FXArray *array, void *object) {
	if (NULL != array && NULL != object) {
		while (FXArrayContainsObject(array, object)) {
			uint64_t index = FXArrayGetIndexOfObject(array, object);
			FXArrayRemoveObjectAtIndex(array, index);
		}
	}
}

bool FXArrayContainsObject(FXArray *array, void *object) {
	if (NULL != array) {
		if (kFXIndexNotFound != FXArrayGetIndexOfObject(array, object)) {
			return true;
		}
	}
	
	return false;
}

uint64_t FXArrayGetIndexOfObject(FXArray *array, void *object) {
	if (NULL != array) {
		uint64_t result = kFXIndexNotFound;
		uint64_t count = FXArrayGetCount(array);
		for (uint64_t index = 0; index < count; index++) {
			void *currentObject = FXArrayGetObjectAtIndex(array, index);
			if (object == currentObject) {
				result = index;
				break;
			}
		}
		
		return result;
	}
	
	return 0;
}

void FXArraySetObjectAtIndex(FXArray *array, void *object, uint64_t index) {
	if (NULL != array) {
		assert(index < FXArrayGetCount(array)); // sanity boundary limit
		
//		void *currentObject = array->_data[index];
		void *currentObject = FXArrayGetObjectAtIndex(array, index);
		if (object != currentObject) {
			// TODO: do it with retain setter
			FXObjectRetain(object);
			FXObjectRelease(currentObject);
			
			array->_data[index] = object;
		}
	}
}

FXArray *FXArrayGetObjectAtIndex(FXArray *array, uint64_t index) {
	if (NULL != array) {
		assert(index < FXArrayGetCount(array)); // sanity boundary limit
		
		return array->_data[index];
	}
	
	return NULL;
}

void FXArrayRemoveObjectAtIndex(FXArray *array, uint64_t index) {
	if (NULL != array) {
		FXArraySetObjectAtIndex(array, NULL, index);

		void **data = FXArrayGetData(array);
		uint64_t count = FXArrayGetCount(array);
		if (index < (count - 1)) { // if removed object isn't last at index
			uint64_t objectsCount = count - (index + 1); // get objects count from deleted object to end of index
			
			memmove(&data[index], &data[index + 1], objectsCount * sizeof(*data)); // and shift it all to the left
		}
		
		data[count - 1] = NULL; // NULL last object
		
		FXArraySetCount(array, count - 1);
	}
}

void FXArrayRemoveAllObjects(FXArray *array) {
	if (NULL != array) {
		uint64_t count = FXArrayGetCount(array);
		for (uint64_t index = 0; index < count; index++) {
			FXArraySetObjectAtIndex(array, NULL, index);
		}
		
		FXArraySetCapacity(array, 0);
	}
}

#pragma mark -
#pragma mark Private Accessors Implementation
