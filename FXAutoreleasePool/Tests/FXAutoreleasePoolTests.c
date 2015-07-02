//
//  FXAutoreleasePoolTests.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/2/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#include "FXAutoreleasePoolTests.h"

extern
void FXAutoreleasePoolTests(void) {
	// ONE POOL ONE OBJECT
	//	after pool was created
	//	after object was created and additionally retained
	//		object reference count must be equal 2
	//	after object was added to pool
	//		retain count for object should not change
	//	after pool was drain
	//		retain count for object must decrease by 1
	
	// release  object
	
	
	// MULTIPLY POOLS and MULTIPLY OBJECTS
	//	after pool was created
	//	after object was created
	//	after adding object into pool 'many' times
	//	after pool was drain
	//	after pool2 was created
	//	after adding object into pool2 'many' times
	//	after pool2 was drain
	
	// release object
	
	
	// MULTIPLY NESTED POOLS
	//	after pool was created
	//	after object was created
	//	after add object into pool
	//		reference count for object should be 1
	//	after pool2 was created
	//	after add object into pool2
	//	after pool3 was created
	//	after add object into pool3
	//	after pool3 was drain
	//	after pool2 was drain
	//	after pool was drain
	
	// release object
}
