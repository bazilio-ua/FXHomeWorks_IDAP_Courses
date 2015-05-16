//
//  FXTestsMacro.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/16/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#include "FXTestsMacro.h"

#pragma mark -
#pragma mark Private Declarations

static unsigned char kFXTestLevelCount = 0;

void FXPerformTestPrintMinusCountOfLevel(unsigned char count);

#pragma mark -
#pragma mark Public Implementation

void _FXPerformTestPrintHeader(void) {
	FXPerformTestPrintMinusCountOfLevel(++kFXTestLevelCount);
}

void _FXPerformTestPrintFooter(void) {
	FXPerformTestPrintMinusCountOfLevel(kFXTestLevelCount--);
}

#pragma mark -
#pragma mark Private Implementation

void FXPerformTestPrintMinusCountOfLevel(unsigned char count) {
//	printf("\n");
	for (unsigned char iterator = 0; iterator < count; iterator++) {
		printf("-");
	}
}
