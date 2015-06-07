//
//  main.c
//  FXArray
//
//  Created by Basil Nikityuk on 6/7/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#include "FXTestsMacro.h"
#include "FXArrayTests.h"

int main(int argc, const char *argv[]) {
	// insert code here...
	printf("FXArray\n");
	
	performTest(FXArrayTests);
	
	return 0;
}
