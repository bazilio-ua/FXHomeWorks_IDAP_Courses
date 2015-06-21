//
//  FXLinkedListNodeTests.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/21/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <assert.h>

#include "FXLinkedListNodeTests.h"
#include "FXLinkedListNode.h"

void FXLinkedListNodeTests(void) {
	//	after creation an object..
	FXObject *object = FXObjectCreateOfType(FXObject);
	
	//		reference count of object must be equal to 1
	assert(1 == FXObjectGetReferenceCount(object));
	
	//	after creation an node with object
	FXLinkedListNode *node = FXLinkedListNodeCreateWithObject(object);
	
	//		reference count of node must be equal to 1
	assert(1 == FXObjectGetReferenceCount(node));
		
	//		reference count of object should increase and be equal to 2
	assert(2 == FXObjectGetReferenceCount(object));
	
	//		object which added to node must be equal to origin object
	assert(object == FXLinkedListNodeGetObject(node));
	
	//	after remove object from node
	FXLinkedListNodeSetObject(node, NULL);
	
	//		his reference count should decrease and be equal to 1
	assert(1 == FXObjectGetReferenceCount(object));
	
	//		reference count of node must stay unchanged and be equal to 1
	assert(1 == FXObjectGetReferenceCount(node));
	
	// release them
	FXObjectRelease(object);
	FXObjectRelease(node);
}
