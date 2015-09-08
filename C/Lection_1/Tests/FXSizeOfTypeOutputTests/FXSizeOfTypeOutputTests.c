//
//  FXSizeOfTypeOutputTests.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/9/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <stdbool.h>

#include "FXSizeOfTypeOutputTests.h"
#include "FXSizeOfTypeOutput.h"

#pragma mark -
#pragma mark Public Implementations

void FXSizeOfTypeOutputTests(void) {
	FXSizeOfTypePrint(char);
	FXSizeOfTypePrint(short);
	FXSizeOfTypePrint(int);
	FXSizeOfTypePrint(long);
	FXSizeOfTypePrint(long long);
	FXSizeOfTypePrint(float);
	FXSizeOfTypePrint(double);
	FXSizeOfTypePrint(long double);
	FXSizeOfTypePrint(void);
	FXSizeOfTypePrint(bool);
}
