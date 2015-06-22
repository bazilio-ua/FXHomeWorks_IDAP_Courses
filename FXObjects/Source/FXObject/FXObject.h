//
//  FXObject.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/16/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef FXHomeWorks_FXObject_h
#define FXHomeWorks_FXObject_h

#include <stdio.h>
#include <stdint.h>

//#include "FXObjectAccessors.h"

typedef void (*FXObjectDeallocatorCallback)(void *); // define signature for Object dealloc callback

typedef struct {
	uint64_t _referenceCount;
	FXObjectDeallocatorCallback _deallocator;
} FXObject;

extern
void __FXObjectDeallocate(void *object);

extern
void *__FXObjectCreate(size_t objectSize, FXObjectDeallocatorCallback deallocateCallback);

#define FXObjectCreateOfType(type) \
	__FXObjectCreate(sizeof(type), (FXObjectDeallocatorCallback)__##type##Deallocate)

extern
void *FXObjectRetain(void *object);

extern
void FXObjectRelease(void *object);

extern
uint64_t FXObjectGetReferenceCount(void *object);

#endif
