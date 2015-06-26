//
//  FXLinkedListEnumerator.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/26/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

//#include <stdio.h>
#include <assert.h>

#include "FXLinkedListEnumerator.h"
#include "FXLinkedListNode.h"

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
FXLinkedListNode *FXLinkedListEnumeratorGetNode(FXLinkedListEnumerator *enumerator);

static
void FXLinkedListEnumeratorSetMutationsCount(FXLinkedListEnumerator *enumerator, uint64_t mutationsCount);

static
uint64_t FXLinkedListEnumeratorGetMutationsCount(FXLinkedListEnumerator *enumerator);

static
bool FXLinkedListEnumeratorMutationsValidate(FXLinkedListEnumerator *enumerator);

static
void FXLinkedListEnumeratorSetValid(FXLinkedListEnumerator *enumerator, bool valid);

#pragma mark -
#pragma mark Public Methods Implementations

// dealloc
void __FXLinkedListEnumeratorDeallocate(FXLinkedListEnumerator *enumerator) {
	FXLinkedListEnumeratorSetNode(enumerator, NULL);
	FXLinkedListEnumeratorSetList(enumerator, NULL);
	
	__FXObjectDeallocate(enumerator);
}

FXLinkedListEnumerator *FXLinkedListEnumeratorCreateWithList(FXLinkedList *list) {
	if (NULL != list && NULL != FXLinkedListGetHead(list)) {
		FXLinkedListEnumerator *enumerator = FXObjectCreateOfType(FXLinkedListEnumerator);
		FXLinkedListEnumeratorSetList(enumerator, list);
		uint64_t mutationsCount = FXLinkedListGetMutationsCount(list);
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
	if (NULL != enumerator) {
		// TODO: do this with retain setter
		FXObjectRetain(list);
		FXObjectRelease(enumerator->_list);
		
		enumerator->_list = list;
	}
}

FXLinkedList *FXLinkedListEnumeratorGetList(FXLinkedListEnumerator *enumerator) {
	if (NULL != enumerator) {
		return enumerator->_list;
	}
	
	return NULL;
}

void FXLinkedListEnumeratorSetNode(FXLinkedListEnumerator *enumerator, FXLinkedListNode *node) {
	if (NULL != enumerator) {
		// TODO: do this with retain setter
		FXObjectRetain(node);
		FXObjectRelease(enumerator->_node);
		
		enumerator->_node = node;
	}
}

FXLinkedListNode *FXLinkedListEnumeratorGetNode(FXLinkedListEnumerator *enumerator) {
	if (NULL != enumerator) {
		return enumerator->_node;
	}
	
	return NULL;
}

void FXLinkedListEnumeratorSetMutationsCount(FXLinkedListEnumerator *enumerator, uint64_t mutationsCount) {
	if (NULL != enumerator) {
		enumerator->_mutationsCount = mutationsCount;
	}
}

uint64_t FXLinkedListEnumeratorGetMutationsCount(FXLinkedListEnumerator *enumerator) {
	if (NULL != enumerator) {
		return enumerator->_mutationsCount;
	}
	
	return 0;
}

bool FXLinkedListEnumeratorMutationsValidate(FXLinkedListEnumerator *enumerator) {
	if (true == FXLinkedListEnumeratorIsValid(enumerator)) {
		FXLinkedList *list = FXLinkedListEnumeratorGetList(enumerator); // get list to compare mutations count
		assert(FXLinkedListGetMutationsCount(list) == FXLinkedListEnumeratorGetMutationsCount(enumerator)); // sanity
		
		return true;
	}
	
	return false;
}

void FXLinkedListEnumeratorSetValid(FXLinkedListEnumerator *enumerator, bool valid) {
	if (NULL != enumerator) {
		enumerator->_valid = valid;
	}
}
