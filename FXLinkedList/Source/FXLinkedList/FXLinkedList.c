//
//  FXLinkedList.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <string.h>

#include "FXLinkedListPrivate.h"
#include "FXLinkedListEnumeratorPrivate.h"

#pragma mark -
#pragma mark Private Declarations

struct FXLinkedList {
	FXObject _super; // inheritance from FXObject
	
	FXLinkedListNode *_head;
	uint64_t _count;
	uint64_t _mutationsCount; // enumerator need this
};

// context search
struct FXLinkedListNodeContext {
	FXLinkedListNode *previousNode;
	FXLinkedListNode *node;
	void *object;
};

static
void FXLinkedListSetCount(FXLinkedList *list, uint64_t count);

static
void FXLinkedListMutate(FXLinkedList *list);

#pragma mark -
#pragma mark Public Methods Implementations

// dealloc
void __FXLinkedListDeallocate(FXLinkedList *list) {
	FXLinkedListSetHead(list, NULL);
	
	__FXObjectDeallocate(list);
}

// just create empty list without an node
FXLinkedList *FXLinkedListCreate(void) {
	FXLinkedList *list = FXObjectCreateOfType(FXLinkedList);
	
	return list;
}

void *FXLinkedListGetFirstObject(FXLinkedList *list) {
	FXLinkedListNode *headNode = FXLinkedListGetHead(list); // get head node from list
	void *object = FXLinkedListNodeGetObject(headNode); // get object from node
	
	return object;
}

void FXLinkedListRemoveFirstObject(FXLinkedList *list) {
	if (NULL != list && false == FXLinkedListIsEmpty(list)) {
		FXLinkedListNode *headNode = FXLinkedListGetHead(list); // get head node from list
		FXLinkedListNode *nextNode = FXLinkedListNodeGetNextNode(headNode); // get next node from head node
		FXLinkedListSetHead(list, nextNode); // set nextNode as new head node of list
		uint64_t currentCount = FXLinkedListGetCount(list) - 1;
		FXLinkedListSetCount(list, currentCount); // decrease current node count
	}
}

void *FXLinkedListGetObjectBeforeObject(FXLinkedList *list, void *object) {
	if (NULL != list && false  == FXLinkedListIsEmpty(list)) {
		FXLinkedListNode *currentNode = FXLinkedListGetHead(list);
		void *previousObject = NULL;
		
		do { // go through all nodes and remember previous on each iteration until we find object
			void *currentObject = FXLinkedListNodeGetObject(currentNode); // get object from current node
			if (object == currentObject) {
				
				return previousObject; // if match, return previous object, or NULL if current node is first node
			}
			
			previousObject = currentObject;
		} while (NULL != (currentNode = FXLinkedListNodeGetNextNode(currentNode))); // until nodes exist
		
	}
	
	return NULL;
}

bool FXLinkedListIsEmpty(FXLinkedList *list) {
	if (NULL != list) {
		if (0 == list->_count) {
			return true;
		}
	}
	
	return false;
}

void FXLinkedListAddObject(FXLinkedList *list, void *object) {
	if (NULL != list) {
		FXLinkedListNode *node = FXLinkedListNodeCreateWithObject(object); // create an node with object
		FXLinkedListNode *headNode = FXLinkedListGetHead(list); // get current head node of list
		FXLinkedListNodeSetNextNode(node, headNode); // link current head node of list as next node to new node
		FXLinkedListSetHead(list, node); // set new node as new head node of list
		
		uint64_t currentCount = FXLinkedListGetCount(list) + 1;
		FXLinkedListSetCount(list, currentCount); // increase current node count
		
		FXObjectRelease(node);
	}
}

void FXLinkedListRemoveObject(FXLinkedList *list, void *object) {
	if (NULL != list) {
		FXLinkedListNodeContext context;
		
		memset(&context, 0, sizeof(context)); // zeroing our context
		context.object = object;
		
		FXLinkedListNode *node;
		while (NULL != (node = FXLinkedListFindNodeWithContext(list, FXLinkedListNodeContainsObject, &context))) {
			if (NULL != node) {
				FXLinkedListNodeSetNextNode(context.previousNode, FXLinkedListNodeGetNextNode(context.node));
				FXLinkedListSetCount(list, FXLinkedListGetCount(list) - 1);
			}
		}
	}
	
	// remove without context
/*	FXLinkedListNode *currentNode = FXLinkedListGetHead(list); // get head node of list as current node
	FXLinkedListNode *previousNode = NULL;
	
	while (NULL != currentNode) { // find node contain object, while nodes exist
		void *currentObject = FXLinkedListNodeGetObject(currentNode); // get current object from node
		FXLinkedListNode *nextNode = FXLinkedListNodeGetNextNode(currentNode); // get next node from current node
		
		if (object == currentObject) { // if equal
			if (currentNode == FXLinkedListGetHead(list)) { // if current head node contains object that should remove 
				FXLinkedListSetHead(list, nextNode); // set nextNode as new headNode
			} else {
				FXLinkedListNodeSetNextNode(previousNode, nextNode); // link previous node to next node, current node with object will be freed
			}

			uint64_t currentCount = FXLinkedListGetCount(list) - 1;
			FXLinkedListSetCount(list, currentCount); // decrease current node count
		}
		
		previousNode = currentNode; // set previous node as current (do shift)
		currentNode = nextNode; // set current node as next node (until nodes exist)
	}	*/
}

void FXLinkedListRemoveAllObject(FXLinkedList *list) {
	if (NULL != list) {
		FXLinkedListSetCount(list, 0); // set node count to zero. other nodes in chains should be freed
	}
}

bool FXLinkedListContainsObject(FXLinkedList *list, void *object) {
	if (NULL != list) {
		FXLinkedListNodeContext context;
		
		// zeroing our context
		memset(&context, 0, sizeof(context)); // context = {*previousNode = NULL, *node = NULL, *object = NULL}
		context.object = object;
		
		if (NULL != FXLinkedListFindNodeWithContext(list, FXLinkedListNodeContainsObject, &context)) {
			
			return true; // found (contain)
		}
		
		// search without context
	/*	FXLinkedListNode *currentNode = FXLinkedListGetHead(list); // get head node of list as current node
		while (NULL != currentNode) { // go through all nodes to find which one who contain object
			void *currentObject = FXLinkedListNodeGetObject(currentNode); // get current object from node
			if (object == currentObject) { // if equal
				
				return true; // found (contain)
			}
			
			currentNode = FXLinkedListNodeGetNextNode(currentNode); // get next node, while nodes exist
		}	*/
	}
	
	return false;
}

uint64_t FXLinkedListGetCount(FXLinkedList *list) {
	if (NULL != list) {
		return list->_count;
	}
	
	return 0;
}

#pragma mark -
#pragma mark Private Accessors Implementation

void FXLinkedListSetCount(FXLinkedList *list, uint64_t count) {
	if (NULL != list) {
		if (0 == count) {
			FXLinkedListSetHead(list, NULL);
		}
		
		list->_count = count;
		FXLinkedListMutate(list); // list is mutate
	}
}

void FXLinkedListMutate(FXLinkedList *list) {
	uint64_t mutationsCount = FXLinkedListGetMutationsCount(list) + 1;
	FXLinkedListSetMutationsCount(list, mutationsCount);
}

#pragma mark -
#pragma mark Private Special Purposes Accessors Implementation

void FXLinkedListSetHead(FXLinkedList *list, FXLinkedListNode *head) {
	if (NULL != list && list->_head != head) {
		// TODO: do this with retain setter
		FXObjectRetain(head);
		FXObjectRelease(list->_head);
		
		list->_head = head;
	}
}

FXLinkedListNode *FXLinkedListGetHead(FXLinkedList *list) {
	if (NULL != list) {
		return list->_head;
	}
	
	return NULL;
}

void FXLinkedListSetMutationsCount(FXLinkedList *list, uint64_t mutationsCount) {
	if (NULL != list) {
		list->_mutationsCount = mutationsCount;
	}
}

uint64_t FXLinkedListGetMutationsCount(FXLinkedList *list) {
	if (NULL != list) {
		return list->_mutationsCount;
	}
	
	return 0;
}

#pragma mark -
#pragma mark Private Special Purposes 'Search by Context' Implementation

FXLinkedListNode *FXLinkedListFindNodeWithContext(FXLinkedList *list, 
												  FXLinkedListNodeComparatorFunction comparator, 
												  FXLinkedListNodeContext *context) 
{
	FXLinkedListNode *contextNode = NULL;
	if (NULL != list) { // if list exist, create enumerator with it
		FXLinkedListEnumerator *enumerator = FXLinkedListEnumeratorCreateWithList(list);
		while (true == FXLinkedListEnumeratorIsValid(enumerator) // until enumerator is valid
			   && NULL != FXLinkedListEnumeratorGetNextObject(enumerator)) // until we reached end of enumerating list
		{
			FXLinkedListNode *node = FXLinkedListEnumeratorGetNode(enumerator);
			
			context->node = node;
			
			if (true == comparator(node, *context)) {
				contextNode = node;
				break; // we don't return here, because, later, we need to release enumerator
			}
			
			context->previousNode = node; // shift nodes
		}
		
		FXObjectRelease(enumerator);
	}
	
	return contextNode;
}

bool FXLinkedListNodeContainsObject(FXLinkedListNode *node, FXLinkedListNodeContext context) {
	if (NULL != node) {
		if (context.object == FXLinkedListNodeGetObject(node)) {
			
			return true;
		}
	}
	
	return false;
}
