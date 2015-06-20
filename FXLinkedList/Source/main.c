//
//  main.c
//  FXLinkedList
//
//  Created by Basil Nikityuk on 6/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#include "FXTestsMacro.h"
#include "FXLinkedListTests.h"

int main(int argc, const char *argv[]) {
	// insert code here...
	printf("FXLinkedList\n");

	performTest(FXLinkedListTests);

	return 0;
}
