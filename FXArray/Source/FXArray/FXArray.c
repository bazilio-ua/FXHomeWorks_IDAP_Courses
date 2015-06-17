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

const uint64_t kFXIndexNotFound = UINT64_MAX;
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
		
		
		// fast version
		uint64_t oldCapacity = array->_capacity;
		if (capacity > oldCapacity) { // if we increase our capacity
			size_t size = (capacity - oldCapacity) * sizeof(*array->_data);
			memset(&array->_data[oldCapacity], 0, size); // zeroing a new allocated block
		}
		
		
//		// slow version (zeroing objects one by one)
//		uint64_t oldCapacity = array->_capacity;
//		if (capacity > oldCapacity) {
//			for (uint64_t index = oldCapacity; index < capacity; index++) {
//				array->_data[index] = NULL;
//			}
//		}
		
		
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
        static uint64_t oldCount = 0;
        bool doIncrease = false;
        
		uint64_t count = FXArrayGetCount(array);
		uint64_t capacity = FXArrayGetCapacity(array);
		
        if (oldCount < count) {
            doIncrease = true;
        }
        
		uint64_t newCapacity;
		if (count < capacity) { // if our count is less than capacity
			if (count == 0) { // release our array
				newCapacity = 0;
			} else { // do choice, until we have enough capacity
				
				uint64_t halfCapacity = capacity / 2;
				if (halfCapacity > count && !doIncrease) { // trim our array
					newCapacity = halfCapacity;
				} else { // do nothing
					newCapacity = capacity;
				}
				
			}
		} else { // increase its size, if (count >= capacity)
			newCapacity = count * 2; // optimal
            if (newCapacity > kFXArrayMaxCapacity) {
                newCapacity = kFXArrayMaxCapacity - 1;
            }
		}
		
		
//		// this is really suck
//		uint64_t newCapacity;
//		if (capacity > count) { // trim our array
//			newCapacity = count;
//		} else if (capacity == count) { // do nothing
//			newCapacity = capacity;
//		} else { // increase its size
//			newCapacity = count * 2; // optimal
//		}
		
        
        oldCount = count;
		
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

void FXArrayRemoveAllInstancesOfObject(FXArray *array, void *object) {
	if (NULL != array && NULL != object) {
		while (FXArrayContainsObject(array, object)) {
			uint64_t index = FXArrayGetIndexOfObject(array, object);
			FXArrayRemoveObjectAtIndex(array, index);
		}
	}
}

void FXArrayRemoveFirstInstanceOfObject(FXArray *array, void *object) {
	if (NULL != array && NULL != object) {
		if (FXArrayContainsObject(array, object)) {
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
		
		void *currentObject = array->_data[index];
		if (object != currentObject) {
			// TODO: do it with retain setter
			FXObjectRetain(object);
			FXObjectRelease(currentObject);
			
			array->_data[index] = object;
		}
	}
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
		void **data = FXArrayGetArray(array);
//		if (index < (count - 1)) { // if inserted object is not last at index
			uint64_t currentCount = count - (index + 1); // get objects count from index of inserted object to end of index
			memmove(&data[index + 1], &data[index], currentCount * sizeof(*data)); // and shift it all to the right by 1
//		}
		data[index] = NULL; // NULL it at index
		
		
//		// slow version (shift objects one by one)
//		FXArraySetCount(array, count + 1); // increase count
//		count = FXArrayGetCount(array); // get new count
//		for (uint64_t currentCount = count - 1; currentCount > index; currentCount--) {
//			FXArraySetObjectAtIndex(array, FXArrayGetObjectAtIndex(array, currentCount - 1), currentCount);
//			// copy objects from current currentCount - 1 to currentCount
//			// array->_data[currentCount] = array->_data[currentCount - 1]
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
		void **data = FXArrayGetArray(array);
		if (index < (count - 1)) { // if removed object isn't last at index
			uint64_t currentCount = count - (index + 1); // get objects count from deleted object to end of index
			memmove(&data[index], &data[index + 1], currentCount * sizeof(*data)); // and shift it all to the left by 1
			
			data[count - 1] = NULL; // NULL last object
		}
//		data[count - 1] = NULL; // NULL last object
		
		
//		// slow version (shift objects one by one)
//		uint64_t count = FXArrayGetCount(array);
//		for (uint64_t currentCount = index + 1; currentCount < count; currentCount++) {
//			FXArraySetObjectAtIndex(array, FXArrayGetObjectAtIndex(array, currentCount), currentCount - 1);
//			// copy objects from current currentCount to currentCount - 1
//			// array->_data[currentCount - 1] = array->_data[currentCount]
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

#pragma mark -
#pragma mark Private Accessors Implementation
