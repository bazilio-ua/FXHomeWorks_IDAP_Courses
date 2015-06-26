//
//  FXLinkedListEnumerator.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/26/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

//#include <stdio.h>

#include "FXLinkedListEnumerator.h"
#include "FXLinkedListNode.h"
#include "FXLinkedList.h"

#pragma mark -
#pragma mark Private Declarations

struct FXLinkedListEnumerator {
	FXObject _super; // inheritance from FXObject
	
	void *_list;
	FXLinkedListNode *_node;
	uint64_t _mutationsCount;
	bool _valid;
};

static
void FXLinkedListEnumeratorSetList(FXLinkedListEnumerator *enumerator, FXLinkedList *list);

static
FXLinkedList *FXLinkedListEnumeratorGetList(FXLinkedListEnumerator *enumerator);

static
void FXLinkedListEnumeratorSetNode(FXLinkedListEnumerator *enumerator, FXLinkedListNode *node);

static
void FXLinkedListEnumeratorSetMutationsCount(FXLinkedListEnumerator *enumerator, uint64_t mutationsCount);

static
uint64_t FXLinkedListEnumeratorGetMutationsCount(FXLinkedListEnumerator *enumerator);

#pragma mark -
#pragma mark Public Methods Implementations

// dealloc
void __FXLinkedListEnumeratorDeallocate(void *enumerator) {
	FXLinkedListEnumeratorSetNode(enumerator, NULL);
	FXLinkedListEnumeratorSetList(enumerator, NULL);
	
	__FXObjectDeallocate(enumerator);
}

FXLinkedListEnumerator *FXLinkedListEnumeratorCreateWithList(void *list) {
	if (NULL != list) {
		FXLinkedListEnumerator *enumerator = FXObjectCreateOfType(FXLinkedListEnumerator);
		FXLinkedListEnumeratorSetList(enumerator, list);
		uint64_t mutationsCount = FXLinkedListEnumeratorGetMutationsCount(list);
		FXLinkedListEnumeratorSetMutationsCount(enumerator, mutationsCount);
		
		return enumerator;
	}
	
	return NULL;
}

void *FXLinkedListEnumeratorGetNextObject(FXLinkedListEnumerator *enumerator) {
	if (NULL != enumerator) {
		// get next object
		return NULL;
	}
	
	return NULL;
}

bool FXLinkedListEnumeratorIsValid(FXLinkedListEnumerator *enumerator) {
	if (NULL != enumerator) {
		if (true == enumerator->_valid) {
			return true;
		}
	}
	
	return false;
}

#pragma mark -
#pragma mark Private Accessors Implementation

void FXLinkedListEnumeratorSetList(FXLinkedListEnumerator *enumerator, FXLinkedList *list) {
	
}

FXLinkedList *FXLinkedListEnumeratorGetList(FXLinkedListEnumerator *enumerator) {
	return NULL;
}

void FXLinkedListEnumeratorSetNode(FXLinkedListEnumerator *enumerator, FXLinkedListNode *node) {
	
}

void FXLinkedListEnumeratorSetMutationsCount(FXLinkedListEnumerator *enumerator, uint64_t mutationsCount) {
	
}

uint64_t FXLinkedListEnumeratorGetMutationsCount(FXLinkedListEnumerator *enumerator) {
	return 0;
}
