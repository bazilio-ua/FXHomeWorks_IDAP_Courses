//
//  FXString.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/6/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef FXHomeWorks_FXString_h
#define FXHomeWorks_FXString_h

#include "FXObject.h"

typedef struct FXString FXString;

// dealloc
extern
void __FXStringDeallocate(FXString *string);

extern
FXString *FXStringCreateWithParameters(const char *data);

extern
void FXStringSetString(FXString *string, const char *data);

extern
char *FXStringGetString(FXString *string);

extern
size_t FXStringGetLength(FXString *string);

#endif
