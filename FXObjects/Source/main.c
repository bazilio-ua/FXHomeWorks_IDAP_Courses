//
//  main.c
//  FXObjects
//
//  Created by Basil Nikityuk on 5/16/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#include "FXTestsMacro.h"
#include "FXObjectTests.h"

int main(int argc, const char *argv[]) {
	// insert code here...
	printf("Objects in C!\n");
	
	performTest(FXObjectTests);
	
	return 0;
}
