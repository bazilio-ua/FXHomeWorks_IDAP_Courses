//
//  FXArray.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/7/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef FXHomeWorks_FXArray_h
#define FXHomeWorks_FXArray_h

#include <stdbool.h>

#include "FXObject.h"

extern const uint64_t kFXIndexNotFound; // used in test suite

typedef struct FXArray FXArray;

// dealloc
extern
void __FXArrayDeallocate(FXArray *array);

extern
FXArray *FXArrayCreateWithCapacity(uint64_t capacity);

//<-- these should be a private
extern
void FXArraySetCapacity(FXArray *array, uint64_t capacity);

extern
uint64_t FXArrayGetCapacity(FXArray *array);

extern
void FXArraySetArray(FXArray *array, void **data);

extern
void **FXArrayGetArray(FXArray *array);

extern
bool FXArrayCountIsIncreased(FXArray *array);

extern
uint64_t FXArrayProposedCapacity(FXArray *array);

extern
bool FXArrayShouldResize(FXArray *array);

extern
void FXArrayResizeIfNeeded(FXArray *array);

extern
void FXArraySetCount(FXArray *array, uint64_t count);

extern
uint64_t FXArrayGetCount(FXArray *array);
//--> these should be a private

extern
void FXArrayAddObject(FXArray *array, void *object);

extern
void FXArrayRemoveAllInstancesOfObject(FXArray *array, void *object);

extern
void FXArrayRemoveFirstInstanceOfObject(FXArray *array, void *object);

extern
bool FXArrayContainsObject(FXArray *array, void *object);

extern
uint64_t FXArrayGetIndexOfObject(FXArray *array, void *object);

extern
void FXArraySetObjectAtIndex(FXArray *array, void *object, uint64_t index); // -> this should be a private

extern
void *FXArrayGetObjectAtIndex(FXArray *array, uint64_t index);

extern
void FXArrayInsertObjectAtIndex(FXArray *array, void *object, uint64_t index);

extern
void FXArrayRemoveObjectAtIndex(FXArray *array, uint64_t index);

extern
void FXArrayRemoveAllObjects(FXArray *array);

#endif
