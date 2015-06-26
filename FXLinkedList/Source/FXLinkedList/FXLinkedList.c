//
//  FXLinkedList.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#include "FXLinkedList.h"
#include "FXLinkedListNode.h"

#pragma mark -
#pragma mark Private Declarations

struct FXLinkedList {
	FXObject _super; // inheritance from FXObject
	
	FXLinkedListNode *_head;
	uint64_t _count;
};

static
void FXLinkedListSetCount(FXLinkedList *list, uint64_t count);

static
void FXLinkedListSetHead(FXLinkedList *list, FXLinkedListNode *head);

static
FXLinkedListNode *FXLinkedListGetHead(FXLinkedList *list);

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
				
				return previousObject; // if match, return previous object, or NULL if current node is last node
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
	FXLinkedListNode *currentNode = FXLinkedListGetHead(list); // get head node of list as current node
	FXLinkedListNode *previousNode = NULL;
	
	while (NULL != currentNode) { // find node contain object, while nodes exist
		void *currentObject = FXLinkedListNodeGetObject(currentNode); // get current object from node
		FXLinkedListNode *nextNode = FXLinkedListNodeGetNextNode(currentNode); // get next node from current node
		
		if (object == currentObject) { // if equal
			if (currentNode == FXLinkedListGetHead(list)) { // if current head node contains object that should remove 
				FXLinkedListSetHead(list, nextNode); // set nextNode as new headNode
			} else {
				FXLinkedListNodeSetNextNode(previousNode, nextNode); // replace for previous node next node link from current to next node
			}

			uint64_t currentCount = FXLinkedListGetCount(list) - 1;
			FXLinkedListSetCount(list, currentCount); // decrease current node count
		}
		
		previousNode = currentNode; // set previous node as current
		currentNode = nextNode; // set current node as next node 
	}
}

void FXLinkedListRemoveAllObject(FXLinkedList *list) {
	if (NULL != list) {
		FXLinkedListSetCount(list, 0); // set node count to zero. other nodes in chains should be freed
	}
}

bool FXLinkedListContainsObject(FXLinkedList *list, void *object) {
	if (NULL != list) {
		FXLinkedListNode *currentNode = FXLinkedListGetHead(list); // get head node of list as current node
		while (NULL != currentNode) { // go through all nodes to find which one who contain object
			void *currentObject = FXLinkedListNodeGetObject(currentNode); // get current object from node
			if (object == currentObject) { // if equal
				
				return true; // found
			}
			
			currentNode = FXLinkedListNodeGetNextNode(currentNode); // get next node, while nodes exist
		}
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
	}
}

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
