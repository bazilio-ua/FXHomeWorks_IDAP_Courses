//
//  main.c
//  FXAutoreleasingStack
//
//  Created by Basil Nikityuk on 7/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#include "FXTestsMacro.h"
#include "FXAutoreleasingStackTests.h"

int main(int argc, const char *argv[]) {
	// insert code here...
	printf("FXAutoreleasingStack\n");
	
	performTest(FXAutoreleasingStackTests);
	
	return 0;
}
