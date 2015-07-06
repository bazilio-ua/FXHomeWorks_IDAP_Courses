//
//  main.c
//  FXAutoreleasePool
//
//  Created by Basil Nikityuk on 7/2/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#include "FXTestsMacro.h"
#include "FXAutoreleasePoolTests.h"

int main(int argc, const char *argv[]) {
	// insert code here...
	printf("FXAutoreleasePool\n");
	
	performTest(FXAutoreleasePoolTests);
	
	return 0;
}
