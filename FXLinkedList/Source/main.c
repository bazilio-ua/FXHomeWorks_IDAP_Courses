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
#include "FXLinkedListNodeTests.h"
#include "FXLinkedListEnumeratorTests.h"

int main(int argc, const char *argv[]) {
	// insert code here...
	printf("FXLinkedList\n");

	performTest(FXLinkedListNodeTests);
	performTest(FXLinkedListTests);
	performTest(FXLinkedListEnumeratorTests);

	return 0;
}
