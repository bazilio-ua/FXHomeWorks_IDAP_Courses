//
//  FXArray.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/7/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#include "FXArray.h"

#pragma mark -
#pragma mark Private Declaration

static const uint64_t kFXIndexNotFound = UINT64_MAX;
static const uint64_t kFXArrayMaxCapacity = kFXIndexNotFound - 1;

struct FXArray {
	FXObject _super; // inheritance from FXObject
	
	void **_data;
	uint64_t _capacity;
};

#pragma mark -
#pragma mark Public Methods Implementation

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
	
}

uint64_t FXArrayGetCapacity(FXArray *array) {
	return 0;
}

void FXArraySetArray(FXArray *array, void **data) {
	
}

void **FXArrayGetArray(FXArray *array) {
	return NULL;
}

void FXArrayAddObject(FXArray *array, void *object) {
	
}

bool FXArrayContainsObject(FXArray *array, void *object) {
	return false;
}

uint64_t FXArrayGetIndexOfObject(FXArray *array, void *object) {
	return 0;
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
