//
//  FXLinkedListEnumerator.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/26/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef FXHomeWorks_FXLinkedListEnumerator_h
#define FXHomeWorks_FXLinkedListEnumerator_h

#include <stdbool.h>

#include "FXObject.h"

typedef struct FXLinkedListEnumerator FXLinkedListEnumerator;

// dealloc
extern
void __FXLinkedListEnumeratorDeallocate(void *object);

extern
FXLinkedListEnumerator *FXLinkedListEnumeratorCreateWithList(void *list);

extern
void *FXLinkedListEnumeratorGetNextObject(FXLinkedListEnumerator *enumerator);

extern
bool FXLinkedListEnumeratorIsValid(FXLinkedListEnumerator *enumerator);

#endif
