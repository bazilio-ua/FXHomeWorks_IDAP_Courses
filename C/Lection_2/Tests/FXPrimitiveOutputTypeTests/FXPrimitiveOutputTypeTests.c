//
//  FXPrimitiveOutputTypeTests.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/10/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#include "FXTestsMacro.h"
#include "FXPrimitiveOutputTypeTests.h"
#include "FXPrimitiveOutputType.h"

#pragma mark -
#pragma mark Private Declaration

FXPrimitiveOutputGenerateType(int, %d);
FXPrimitiveOutputGenerateType(short, %d);
FXPrimitiveOutputGenerateType(char, %c);
FXPrimitiveOutputGenerateType(float, %5.4f);

static
void FXPrimitiveOutputTypeMethodTests(void);

static
void FXPrimitiveOutputTypeMacroTests(void);

#pragma mark -
#pragma mark Public Implementation

void FXPrimitiveOutputTypeTest(void) {
	performTest(FXPrimitiveOutputTypeMethodTests);
	performTest(FXPrimitiveOutputTypeMacroTests);
}

#pragma mark -
#pragma mark Private Implementation

void FXPrimitiveOutputTypeMethodTests(void) {
	output_int(50);
	output_char('A');
	output_char('b');
	output_short(12);
	output_float(7.6f);
}

void FXPrimitiveOutputTypeMacroTests(void) {
	FXPrimitiveOutputValueType(short, 32);
	FXPrimitiveOutputValueType(float, 11.5f);
	FXPrimitiveOutputValueType(int, 8);
}
