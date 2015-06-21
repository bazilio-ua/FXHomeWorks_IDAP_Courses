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

void *FXLinkedListGetFirstObject(FXLinkedList *list) {
	FXLinkedListNode *node = FXLinkedListGetHead(list); // get head node from list
	void *object = FXLinkedListNodeGetObject(node); // get object from node
	
	return object;
}

void FXLinkedListRemoveFirstObject(FXLinkedList *list) {
	FXLinkedListNode *node = FXLinkedListGetHead(list); // get head node from list
	FXLinkedListNode *nextNode = FXLinkedListNodeGetNextNode(node); // get nextnode from head node
	
	FXLinkedListSetHead(list, nextNode); // set nextNode as new head of list
}

void *FXLinkedListGetObjectBeforeObject(FXLinkedList *list, void *object) {
	if (NULL != list && false  == FXLinkedListIsEmpty(list)) {
		FXLinkedListNode *node = FXLinkedListGetHead(list);
		void *previousObject = NULL;
		
		do { // do enumerate nodes and remember previous on each iteration until we find object
			void *currentObject = FXLinkedListNodeGetObject(node); // get object from current node
			if (object == currentObject) {
				
				return previousObject; // if match, return previous object, or NULL if current node is last node
			}
			
			previousObject = currentObject;
		} while (NULL != (node = FXLinkedListNodeGetNextNode(node))); // until nodes exist
		
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
		FXLinkedListNode *nextNode = FXLinkedListGetHead(list); // get current head node of list
		FXLinkedListNodeSetNextNode(node, nextNode); // link current head node of list as nextNode to new node
		
		FXLinkedListSetHead(list, node); // set new node as new head node of list
		
		list->_count++;
		
		FXObjectRelease(node);
	}
}

void FXLinkedListRemoveObject(FXLinkedList *list, void *object) {
	FXLinkedListNode *node = FXLinkedListGetHead(list); // get head of list
	FXLinkedListNode *previousNode = NULL;
	
	while (NULL != node) { // find node contain object, while nodes exist
		void *currentObject = FXLinkedListNodeGetObject(node); // get current object from node
		if (object == currentObject) { // if equal
			FXLinkedListNode *nextNode = FXLinkedListNodeGetNextNode(node); // get next node from current node
			
			FXLinkedListNodeSetNextNode(previousNode, nextNode); // and replace for previous node next node link from current to next node
			
			list->_count--;
			
			node = nextNode; // set nextnode as current
		}
		
		previousNode = node;
		node = FXLinkedListNodeGetNextNode(node); // get next node
	}
}

void FXLinkedListRemoveAllObject(FXLinkedList *list) {
	if (NULL != list) {
		FXLinkedListSetHead(list, NULL); // do release of head. other nodes in chains should be freed
		
		list->_count = 0;
	}
}

bool FXLinkedListContainsObject(FXLinkedList *list, void *object) {
	if (NULL != list) {
		FXLinkedListNode *node = FXLinkedListGetHead(list); // get head node of list
		while (NULL != node) { // go through all nodes to find which one who contain object, while nodes exist
			void *currentObject = FXLinkedListNodeGetObject(node); // get current object from node
			if (object == currentObject) { // if equal
				
				return true; // found
			}
			
			node = FXLinkedListNodeGetNextNode(node); // get next node
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
