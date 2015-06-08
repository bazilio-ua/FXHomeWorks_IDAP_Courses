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

typedef struct FXArray FXArray;

// dealloc
extern
void __FXArrayDeallocate(FXArray *array);

extern
FXArray *FXArrayCreateWithCapacity(uint64_t capacity);

extern
void FXArraySetCapacity(FXArray *array, uint64_t capacity);

extern
uint64_t FXArrayGetCapacity(FXArray *array);

extern
void FXArraySetArray(FXArray *array, void **data);

extern
void **FXArrayGetArray(FXArray *array);

extern
void FXArrayAddObject(FXArray *array, void *object);

extern
bool FXArrayContainsObject(FXArray *array, void *object);

extern
uint64_t FXArrayGetIndexOfObject(FXArray *array, void *object);

extern
FXArray *FXArrayGetObjectAtIndex(FXArray *array, uint64_t index);

extern
void FXArrayRemoveObjectAtIndex(FXArray *array, uint64_t index);

extern
void FXArrayRemoveAllObjects(FXArray *array);

#endif
