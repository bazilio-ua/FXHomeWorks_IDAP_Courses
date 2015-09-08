//
//  FXLinkedListNode.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/21/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#include "FXLinkedListNode.h"

#pragma mark -
#pragma mark Private Declarations

struct FXLinkedListNode {
	FXObject _super; // inheritance from FXObject
	
	FXLinkedListNode *_nextNode;
	void *_object; // void here is because we don't wanna to cast types to FXObject every time
};

#pragma mark -
#pragma mark Public Methods Implementations

// dealloc
void __FXLinkedListNodeDeallocate(FXLinkedListNode *node) {
	FXLinkedListNodeSetObject(node, NULL);
	FXLinkedListNodeSetNextNode(node, NULL);
	
	__FXObjectDeallocate(node);
}

// just create empty node without an object
FXLinkedListNode *FXLinkedListNodeCreate(void) {
	FXLinkedListNode *node = FXObjectCreateOfType(FXLinkedListNode);
	
	return node;
}

FXLinkedListNode *FXLinkedListNodeCreateWithObject(void *object) {
	FXLinkedListNode *node = FXObjectCreateOfType(FXLinkedListNode);
	FXLinkedListNodeSetObject(node, object);
	
	return node;
}

FXLinkedListNode *FXLinkedListNodeGetNextNode(FXLinkedListNode *node) {
	if (NULL != node) {
		return node->_nextNode;
	}
	
	return NULL;
}

void FXLinkedListNodeSetNextNode(FXLinkedListNode *node, FXLinkedListNode *nextNode) {
	if (NULL != node && node->_nextNode != nextNode) {
		// TODO: do this with retain setter
		FXObjectRetain(nextNode);
		FXObjectRelease(node->_nextNode);
		
		node->_nextNode = nextNode;
	}
}

void *FXLinkedListNodeGetObject(FXLinkedListNode *node) {
	if (NULL != node) {
		return node->_object;
	}
	
	return NULL;
}

void FXLinkedListNodeSetObject(FXLinkedListNode *node, void *object) {
	if (NULL != node) {
		// TODO: do this with retain setter
		FXObjectRetain(object);
		FXObjectRelease(node->_object);
		
		node->_object = object;
	}
}

#pragma mark -
#pragma mark Private Accessors Implementation
