//
//  FXTestsMacro.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/16/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <stdint.h>

#include "FXTestsMacro.h"

#pragma mark -
#pragma mark Private Declarations

static uint8_t kFXTestLevelCount = 0;

void FXPerformTestPrintMinusCountOfLevel(uint8_t count);

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

void FXPerformTestPrintMinusCountOfLevel(uint8_t count) {
//	printf("\n");
	for (uint8_t iterator = 0; iterator < count; iterator++) {
		printf("-");
	}
}
