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
	
	//	after creation nextnode
	FXLinkedListNode *nextNode = FXLinkedListNodeCreate();
	
	//		reference count of nextnode must be equal to 1
	assert(1 == FXObjectGetReferenceCount(nextNode));
	
	//		reference count of node must be equal to 1
	assert(1 == FXObjectGetReferenceCount(node));
	
	//	after set nextnode as nextnode of current node
	FXLinkedListNodeSetNextNode(node, nextNode);
	
	//	nextNode of origin node must be equal to nextnode
	assert(nextNode == FXLinkedListNodeGetNextNode(node));
	
	//		reference count of nextnode must be equal to 2
	assert(2 == FXObjectGetReferenceCount(nextNode));
	
	//		reference count of node should be unchanged and equal to 1
	assert(1 == FXObjectGetReferenceCount(node));
	
	//	after added an object to nextnode
	FXLinkedListNodeSetObject(nextNode, object);
	
	//		reference count of object should increase and be equal to 2
	assert(2 == FXObjectGetReferenceCount(object));
	
	//		object which added to nextnode must be equal to origin object
	assert(object == FXLinkedListNodeGetObject(nextNode));
	
	//		reference count of nextnode should be unchanged and equal to 2
	assert(2 == FXObjectGetReferenceCount(nextNode));
	
	//		reference count of node should be unchanged and equal to 1
	assert(1 == FXObjectGetReferenceCount(node));
	
	//	after adding origin object to origin node
	FXLinkedListNodeSetObject(node, object);
	
	//		reference count of origin object should increase and be equal to 3
	assert(3 == FXObjectGetReferenceCount(object));
	
	//		objects in origin node and nextnode must be equal
	assert(FXLinkedListNodeGetObject(node) == FXLinkedListNodeGetObject(nextNode));
	
	//		reference count of nextnode should be unchanged and equal to 2
	assert(2 == FXObjectGetReferenceCount(nextNode));
	
	//		reference count of node should be unchanged and equal to 1
	assert(1 == FXObjectGetReferenceCount(node));
	
	// release them
	FXObjectRelease(object);
	FXObjectRelease(node);
}
