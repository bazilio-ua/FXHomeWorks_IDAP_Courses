//
//  FXAutoreleasePool.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/2/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef FXHomeWorks_FXAutoreleasePool_h
#define FXHomeWorks_FXAutoreleasePool_h

#include "FXObject.h"

typedef struct FXAutoreleasePool FXAutoreleasePool;

// dealloc (just in case)
extern
void __FXAutoreleasePoolDeallocate(FXAutoreleasePool *pool);

extern
FXAutoreleasePool *FXAutoreleasePoolCreate(void);

extern
void FXAutoreleasePoolAddObject(FXAutoreleasePool *pool, void *object);

extern
void FXAutoreleasePoolDrain(FXAutoreleasePool *pool);

#endif
