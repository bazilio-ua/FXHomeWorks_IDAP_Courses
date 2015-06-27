//
//  FXLinkedListEnumeratorTests.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/26/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <assert.h>

#include "FXLinkedListEnumeratorTests.h"
#include "FXLinkedListEnumerator.h"

void FXLinkedListEnumeratorTests(void) {
	FXObject *originObjects[10];
	memset(originObjects, 0, sizeof(originObjects)); // zeroing it
	
	//	after creating list with 10 objects
	FXLinkedList *list = FXLinkedListCreate();
	for (uint64_t index = 0; index < 10; index++) {
		FXObject *object = FXObjectCreateOfType(FXObject);
		FXLinkedListAddObject(list, object);
		
		// place objects in reverse order
		originObjects[9 - index] = object;
		
		FXObjectRelease(object);
	}
	
	//		list reference count should be equal to 1
	assert(1 == FXObjectGetReferenceCount(list));
	
	//		list count should be equal 10
	assert(10 == FXLinkedListGetCount(list));
	
	//	after enumerator was created
	FXLinkedListEnumerator *enumerator = FXLinkedListEnumeratorFromList(list);
	
	//		list reference count should increase to 2
	assert(2 == FXObjectGetReferenceCount(list));
	
	//		enumerator reference count should be 1
	assert(1 == FXObjectGetReferenceCount(enumerator));
	
	//		enumerator iterations count should be 10
	uint64_t iterationsCount = 0;
	FXObject *object = FXLinkedListEnumeratorGetNextObject(enumerator);
	while (true == FXLinkedListEnumeratorIsValid(enumerator)) {
		assert(originObjects[iterationsCount] == object);
		
		iterationsCount++;
		
		object = FXLinkedListEnumeratorGetNextObject(enumerator);
	}
	assert(10 == iterationsCount);
	
	FXObjectRelease(enumerator);
	FXObjectRelease(list);
}
