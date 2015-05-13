//
//  FXBitOutputTests.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/11/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#include "FXBitOutputTests.h"
#include "FXBitOutput.h"

#pragma mark -
#pragma mark Private Declaration

static
void FXByteOutputTests(void);

static
void FXBitFieldOutputTests(void);

#pragma mark -
#pragma mark Public Implementation

void FXBitOutputTests(void) {
	FXByteOutputTests();
//	FXBitFieldOutputTests();
}

#pragma mark -
#pragma mark Private Implementation

void FXByteOutputTests(void) {
	char testValue = 7;
	
	FXByteValueOutput(&testValue); // take address of testValue
	printf(".\n");
}

void FXBitFieldOutputTests(void) {
	int testValue = 7;
//	char *testValue[] = {"u","n","i","x"};
	
	printf("testValue\n");
	FXBitFieldValueOutput(&testValue, sizeof(testValue));
	printf("\n");
	
	printf("rev. testValue\n");
	FXBitFieldValueOutputRev(&testValue, sizeof(testValue));
	printf("\n");
}
