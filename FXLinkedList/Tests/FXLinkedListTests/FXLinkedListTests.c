//
//  FXLinkedListTests.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <assert.h>

#include "FXLinkedListTests.h"
#include "FXLinkedList.h"

void FXLinkedListTests(void) {
	//	after list was created
	FXLinkedList *list = FXLinkedListCreate();
	
	//		list must be empty
	assert(true == FXLinkedListIsEmpty(list));
	
	//	after object was created
	FXObject *object = FXObjectCreateOfType(FXObject);
	
	//		list must don't contain object
	assert(false == FXLinkedListContainsObject(list, object));
	
	//	after object was added to list
	FXLinkedListAddObject(list, object);
	
	//		object reference count must be equal to 2
	assert(2 == FXObjectGetReferenceCount(object));
	
	//		list must don't be empty
	assert(false == FXLinkedListIsEmpty(list));
	
	//		list must contain object
	assert(true == FXLinkedListContainsObject(list, object));
	
	//	after object was removed from list
	FXLinkedListRemoveObject(list, object);
	
	//		list should be empty
	assert(true == FXLinkedListIsEmpty(list));
	
	//		list shouldn't contain object
	assert(false == FXLinkedListContainsObject(list, object));

	//		object reference count must be equal to 1
	assert(1 == FXObjectGetReferenceCount(object));
	
	//	after object was added to list 2000 times
	for (uint64_t iterator = 0; iterator < 2000; iterator++) {
		FXLinkedListAddObject(list, object);
	}
	
	//		list must not be empty
	assert(false == FXLinkedListIsEmpty(list));
	
	//		list must contain object
	assert(true == FXLinkedListContainsObject(list, object));
	
	//		object reference count must be equal to 2001
	assert(2001 == FXObjectGetReferenceCount(object));
	
	//	after object was removed from list
	FXLinkedListRemoveFirstObject(list);
	
	//		object reference count must be equal to 2000
	assert(2000 == FXObjectGetReferenceCount(object));
	
	//	after object was removed from list
	FXLinkedListRemoveObject(list, object);
	
	//		object reference count must be equal to 1
	assert(1 == FXObjectGetReferenceCount(object));
	
	//		list should be empty
	assert(true == FXLinkedListIsEmpty(list));
	
	//		list shouldn't contain object
	assert(false == FXLinkedListContainsObject(list, object));
	
	// release them
	FXObjectRelease(object);
	FXObjectRelease(list);
}
