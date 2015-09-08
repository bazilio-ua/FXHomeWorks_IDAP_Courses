//
//  main.c
//  FXString
//
//  Created by Basil Nikityuk on 6/6/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#include "FXTestsMacro.h"
#include "FXStringTests.h"

int main(int argc, const char *argv[]) {
	// insert code here...
	printf("FXString\n");
	
	performTest(FXStringTests);
	
	return 0;
}
