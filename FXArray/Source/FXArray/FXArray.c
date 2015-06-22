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
#include <stdbool.h>
#include <assert.h>

#include "FXArray.h"

#pragma mark -
#pragma mark Private Declaration

const uint64_t kFXIndexNotFound = UINT64_MAX;
static const uint64_t kFXArrayMaxCapacity = kFXIndexNotFound - 1;

struct FXArray {
	FXObject _super; // inheritance from FXObject
	
	void **_data;
	uint64_t _capacity;
	uint64_t _count;
};

//<-- these should be a private
static
void FXArraySetObjectAtIndex(FXArray *array, void *object, uint64_t index); // -> private

static
void FXArraySetCapacity(FXArray *array, uint64_t capacity);

static
void FXArraySetData(FXArray *array, void **data);

static
void **FXArrayGetData(FXArray *array);

static
uint64_t FXArrayProposedCapacity(FXArray *array, bool doIncrease);

static
bool FXArrayShouldResize(FXArray *array, bool doIncrease);

static
void FXArrayResizeIfNeeded(FXArray *array, bool doIncrease);

static
void FXArraySetCount(FXArray *array, uint64_t count);
//--> these should be a private

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

void FXArrayAddObject(FXArray *array, void *object) {
	if (NULL != array && NULL != object) {
		uint64_t count = FXArrayGetCount(array); // get current count
		FXArraySetCount(array, count + 1); // increase it
		FXArraySetObjectAtIndex(array, object, count); // place our new object to new count index
	}
}

void FXArrayRemoveObject(FXArray *array, void *object) {
	if (NULL != array && NULL != object) {
		
	searchAgain:;
		uint64_t index = FXArrayGetIndexOfObject(array, object);
		if (kFXIndexNotFound != index) {
			FXArrayRemoveObjectAtIndex(array, index);
			goto searchAgain;
		}
		
//		while (FXArrayContainsObject(array, object)) {
//			uint64_t index = FXArrayGetIndexOfObject(array, object);
//			FXArrayRemoveObjectAtIndex(array, index);
//		}
		
	}
}

void FXArrayRemoveFirstInstanceOfObject(FXArray *array, void *object) {
	if (NULL != array && NULL != object) {
		
		uint64_t index = FXArrayGetIndexOfObject(array, object);
		if (kFXIndexNotFound != index) {
			FXArrayRemoveObjectAtIndex(array, index);
		}
		
//		if (FXArrayContainsObject(array, object)) {
//			uint64_t index = FXArrayGetIndexOfObject(array, object);
//			FXArrayRemoveObjectAtIndex(array, index);
//		}
		
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


void *FXArrayGetObjectAtIndex(FXArray *array, uint64_t index) {
	if (NULL != array) {
		assert(index < FXArrayGetCount(array)); // sanity boundary limit
		
		return array->_data[index];
	}
	
	return NULL;
}

void FXArrayInsertObjectAtIndex(FXArray *array, void *object, uint64_t index) {
	if (NULL != array && NULL != object) {
		uint64_t count = FXArrayGetCount(array); // get current count
		assert(index < count); // sanity boundary limit
		
		// fast version
		FXArraySetCount(array, count + 1); // increase count
		count = FXArrayGetCount(array); // get new count
		void **data = FXArrayGetData(array);
//		if (index < (count - 1)) { // if inserted object is not last at index
			uint64_t shiftCount = count - (index + 1); // get objects count from index of inserted object to end of index
			memmove(&data[index + 1], &data[index], shiftCount * sizeof(*data)); // and shift it all to the right by 1
//		}
		data[index] = NULL; // NULL it at index
		
		
//		// 'slow' version (shift objects one by one)
//		FXArraySetCount(array, count + 1); // increase count
//		count = FXArrayGetCount(array); // get new count
//		for (uint64_t shiftCount = count - 1; shiftCount > index; shiftCount--) {
//			FXArraySetObjectAtIndex(array, FXArrayGetObjectAtIndex(array, shiftCount - 1), shiftCount);
//			// copy objects from current shiftCount - 1 to shiftCount
//			// array->_data[shiftCount] = array->_data[shiftCount - 1]
//		}
//		FXArraySetObjectAtIndex(array, NULL, index); // NULL it at index
		
		
		FXArraySetObjectAtIndex(array, object, index);
	}
}

void FXArrayRemoveObjectAtIndex(FXArray *array, uint64_t index) {
	if (NULL != array) {
		FXArraySetObjectAtIndex(array, NULL, index);
		
		// fast version
		uint64_t count = FXArrayGetCount(array);
		void **data = FXArrayGetData(array);
		if (index < (count - 1)) { // if removed object isn't last at index
			uint64_t shiftCount = count - (index + 1); // get objects count from deleted object to end of index
			memmove(&data[index], &data[index + 1], shiftCount * sizeof(*data)); // and shift it all to the left by 1
			
			data[count - 1] = NULL; // NULL last object
		}
//		data[count - 1] = NULL; // NULL last object
		
		
//		// 'slow' version (shift objects one by one)
//		uint64_t count = FXArrayGetCount(array);
//		for (uint64_t shiftCount = index + 1; shiftCount < count; shiftCount++) {
//			FXArraySetObjectAtIndex(array, FXArrayGetObjectAtIndex(array, shiftCount), shiftCount - 1);
//			// copy objects from current shiftCount to shiftCount - 1
//			// array->_data[shiftCount - 1] = array->_data[shiftCount]
//		}
//		FXArraySetObjectAtIndex(array, NULL, count - 1); // NULL last object
		
		
		FXArraySetCount(array, count - 1);
	}
}

void FXArrayRemoveAllObjects(FXArray *array) {
	if (NULL != array) {
		uint64_t count = FXArrayGetCount(array);
		while (count--) {
			FXArraySetObjectAtIndex(array, NULL, count);
		}
		
		FXArraySetCount(array, 0);
	}
}

uint64_t FXArrayGetCapacity(FXArray *array) {
	if (NULL != array && NULL != array->_data) {
		return array->_capacity;
	}
	
	return 0;
}

uint64_t FXArrayGetCount(FXArray *array) {
	if (NULL != array) {
		return array->_count;
	}
	
	return 0;
}

#pragma mark -
#pragma mark Private Accessors Implementation

void FXArraySetObjectAtIndex(FXArray *array, void *object, uint64_t index) {
	if (NULL != array) {
//		assert(index < FXArrayGetCount(array)); // sanity boundary limit
		
//		void *currentObject = array->_data[index];
		void *currentObject = FXArrayGetObjectAtIndex(array, index);
		if (object != currentObject) {
			
			FXRetainSetter(array, _data[index], object);
			
//			// TODO: do it with retain setter
//			FXObjectRetain(object);
//			FXObjectRelease(currentObject);
//			
//			array->_data[index] = object;
		}
	}
}

void FXArraySetCapacity(FXArray *array, uint64_t capacity) {
	if (NULL != array && array->_capacity != capacity) {
		assert(kFXArrayMaxCapacity >= capacity); // sanity
		
		void **previousData = FXArrayGetData(array);
		size_t size = capacity * sizeof(*array->_data);
		if (0 != size) { // set new capacity or resize
			if (NULL == previousData) {
				array->_data = malloc(size); // new alloc
			} else {
				array->_data = realloc(array->_data, size); // re-alloc
			}
			assert(NULL != array->_data); // make sure allocation is successfull
			
		} else if (0 == size && NULL != previousData) { // remove all objects or dealloc
			free(array->_data);
			array->_data = NULL;
		}
		
		
		// fast version
		uint64_t previousCapacity = array->_capacity;
		if (capacity > previousCapacity) { // if we increase our capacity
			size_t size = (capacity - previousCapacity) * sizeof(*array->_data);
			memset(&array->_data[previousCapacity], 0, size); // zeroing a new allocated block
		}
		
		
//		// 'slow' version (zeroing objects one by one)
//		uint64_t previousCapacity = array->_capacity;
//		if (capacity > previousCapacity) {
//			for (uint64_t index = previousCapacity; index < capacity; index++) {
//				array->_data[index] = NULL;
//			}
//		}
		
		
		array->_capacity = capacity;
	}
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

uint64_t FXArrayProposedCapacity(FXArray *array, bool doIncrease) {
	if (NULL != array) {
		uint64_t capacity = FXArrayGetCapacity(array);
		uint64_t count = FXArrayGetCount(array);
		
		uint64_t newCapacity;
		if (count < capacity) { // if our count is less than capacity
			if (count == 0) { // release our array
				newCapacity = 0;
			} else { // do choice, until we have enough capacity
				
				uint64_t halfCapacity = capacity / 2;
				if (halfCapacity > count && !doIncrease) { // trim our array, only if we don't increase count
					newCapacity = halfCapacity;
				} else { // do nothing
					newCapacity = capacity;
				}
				
			}
		} else if (count > capacity) { // increase its size
			
			newCapacity = count * 2; // optimal
            if (newCapacity > kFXArrayMaxCapacity) {
                newCapacity = kFXArrayMaxCapacity;
            }
			
		} else { // if equal
			newCapacity = capacity;
		}
		
		return newCapacity;
	}
	
	return 0;
}

bool FXArrayShouldResize(FXArray *array, bool doIncrease) {
	if (NULL != array) {
		if (array->_capacity != FXArrayProposedCapacity(array, doIncrease)) {
			return true;
		}
	}
	
	return false;
}

void FXArrayResizeIfNeeded(FXArray *array, bool doIncrease) {
	if (FXArrayShouldResize(array, doIncrease)) {
		FXArraySetCapacity(array, FXArrayProposedCapacity(array, doIncrease));
	}
}

void FXArraySetCount(FXArray *array, uint64_t count) {
	if (NULL != array) {
		assert(kFXArrayMaxCapacity >= count); // sanity
		
		bool doIncrease = false;
		uint64_t previousCount = FXArrayGetCount(array);
        if (previousCount < count) {
			doIncrease = true;
        }
		
		array->_count = count;
		
		FXArrayResizeIfNeeded(array, doIncrease);
	}
}
