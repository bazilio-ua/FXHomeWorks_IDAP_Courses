//
//  FXParentOutput.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/4/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef FXHomeWorks_FXParentOutput_h
#define FXHomeWorks_FXParentOutput_h

#include <stdio.h>

typedef enum {
	FXParentUndefined,
	FXParentMother,
	FXParentFather,
	FXParentMotherFather
} FXParentType;

extern
FXParentType FXParentGetType(int value);

#endif
