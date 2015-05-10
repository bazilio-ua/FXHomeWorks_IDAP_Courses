//
//  FXSizeOfTypeOutputTests.c
//  Lection_1
//
//  Created by Basil Nikityuk on 5/9/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

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
}
