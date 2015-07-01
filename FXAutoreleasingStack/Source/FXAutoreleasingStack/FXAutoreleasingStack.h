//
//  FXAutoreleasingStack.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef FXHomeWorks_FXAutoreleasingStack_h
#define FXHomeWorks_FXAutoreleasingStack_h

#include <stdbool.h>

#include "FXObject.h"

typedef struct FXAutoreleasingStack FXAutoreleasingStack;

typedef enum {
	kFXAutoreleasingStackPoppedNULL,
	kFXAutoreleasingStackPoppedObject
} FXAutoreleasingStackPopType;

// dealloc
extern
void __FXAutoreleasingStackDeallocate(FXAutoreleasingStack *stack);

extern
FXAutoreleasingStack *FXAutoreleasingStackCreateWithSize(size_t size);

extern
void FXAutoreleasingStackPushObject(FXAutoreleasingStack *stack, void *object);

extern
FXAutoreleasingStackPopType FXAutoreleasingStackPopObject(FXAutoreleasingStack *stack);

extern
FXAutoreleasingStackPopType FXAutoreleasingStackPopObjectsUntilNULL(FXAutoreleasingStack *stack);

extern
bool FXAutoreleasingStackIsEmpty(FXAutoreleasingStack *stack);

extern
bool FXAutoreleasingStackIsFull(FXAutoreleasingStack *stack);

#endif
