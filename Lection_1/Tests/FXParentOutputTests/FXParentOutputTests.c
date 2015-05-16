//
//  FXParentOutputTests.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/9/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#include "FXTestsMacro.h"
#include "FXParentOutputTests.h"
#include "FXParentOutput.h"

#pragma mark -
#pragma mark Private Declarations

static
void FXParentOutputIteratedTests(void);

static
void FXParentOutputIterateCountTests(int count);

static
void FXParentGetTypeTests(void);

static
void FXParentGetTypeValueTests(int value);

#pragma mark -
#pragma mark Public Implementations

void FXParentOutputTests(void) {
	performTest(FXParentGetTypeTests);
	performTest(FXParentOutputIteratedTests);
}

#pragma mark -
#pragma mark Private Implementations

void FXParentOutputIteratedTests(void) {
	FXParentOutputIterateCountTests(1000);
}

void FXParentOutputIterateCountTests(int count) {
	FXParentType parent;
	int iterator = 0;
	
	while (iterator < count) {
		printf("iteration is: %d\n", iterator);
		parent = FXParentGetType(iterator);
		iterator++;
	}
}

void FXParentGetTypeTests(void) {
	FXParentGetTypeValueTests(0);
	FXParentGetTypeValueTests(3);
	FXParentGetTypeValueTests(5);
	FXParentGetTypeValueTests(15);
	FXParentGetTypeValueTests(20);
	FXParentGetTypeValueTests(25);
	FXParentGetTypeValueTests(30);
	FXParentGetTypeValueTests(95);
	FXParentGetTypeValueTests(100);
}

void FXParentGetTypeValueTests(int value) {
	FXParentType parent;

	parent = FXParentGetType(value);
	printf("function FXParentGetType get value: %d, and return - %d\n", value, parent);
}
