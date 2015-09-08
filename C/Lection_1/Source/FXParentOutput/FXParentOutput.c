//
//  FXParentOutput.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/4/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#include "FXParentOutput.h"

#pragma mark -
#pragma mark Private Declarations

static const int kFXMotherDivider = 3,
				 kFXFatherDivider = 5,
				 kFXMotherFatherDivider = 15;

#pragma mark -
#pragma mark Public Implementations

FXParentType FXParentGetType(int value) {
	FXParentType result = FXParentUndefined;
	
	if (0 == value % kFXMotherDivider) {
		printf("Mother");
		result = FXParentMother;
	}
	
	if (0 == value % kFXFatherDivider) {
		printf("Father");
		if (FXParentMother == result) {
			result = FXParentMotherFather;
		} else {
			result = FXParentFather;
		}
	}
	
	if (FXParentUndefined != result) {
		printf("\n");
	}
		
	return result;
}
