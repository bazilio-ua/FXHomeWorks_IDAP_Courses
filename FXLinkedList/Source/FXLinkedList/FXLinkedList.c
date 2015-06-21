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

#pragma mark -
#pragma mark Public Methods Implementations

// dealloc
void __FXLinkedListDeallocate(FXLinkedList *list) {
	
}

void *FXLinkedListGetFirstObject(FXLinkedList *list) {
	return NULL;
}

void FXLinkedListRemoveFirstObject(FXLinkedList *list) {
	
}

void *FXLinkedListGetObjectBeforeObject(FXLinkedList *list, void *object) {
	return NULL;
}

bool FXLinkedListIsEmpty(FXLinkedList *list) {
	return false;
}

void FXLinkedListAddObject(FXLinkedList *list, void *object) {
	
}

void FXLinkedListRemoveObject(FXLinkedList *list, void *object) {
	
}

void FXLinkedListRemoveAllObject(FXLinkedList *list) {
	
}

bool FXLinkedListContainsObject(FXLinkedList *list, void *object) {
	return false;
}

uint64_t FXLinkedListGetCount(FXLinkedList *list) {
	return 0;
}

#pragma mark -
#pragma mark Private Accessors Implementation
