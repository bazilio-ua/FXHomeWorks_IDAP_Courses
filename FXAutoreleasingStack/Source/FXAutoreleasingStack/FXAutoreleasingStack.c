//
//  FXAutoreleasingStack.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#include "FXAutoreleasingStack.h"

#pragma mark -
#pragma mark Private Declarations

struct FXAutoreleasingStack {
	FXObject _super; // inheritance from FXObject
	
	void **_data;
	void *_head;
	size_t size;
};

static
void **FXAutoreleasingStackGetData(FXAutoreleasingStack *stack);

static
void *FXAutoreleasingStackGetHead(FXAutoreleasingStack *stack);

static
void FXAutoreleasingStackSetHead(FXAutoreleasingStack *stack, void *head);

static
size_t FXAutoreleasingStackGetSize(FXAutoreleasingStack *stack);

static
void FXAutoreleasingStackSetSize(FXAutoreleasingStack *stack, size_t size);

#pragma mark -
#pragma mark Public Implementations

// dealloc
void __FXAutoreleasingStackDeallocate(FXAutoreleasingStack *stack) {
	
}

FXAutoreleasingStack *FXAutoreleasingStackCreateWithSize(size_t size) {
	return NULL;
}

void FXAutoreleasingStackPushObject(FXAutoreleasingStack *stack, void *object) {
	
}

FXAutoreleasingStackPopType FXAutoreleasingStackPopObject(FXAutoreleasingStack *stack) {
	return 0;
}

FXAutoreleasingStackPopType FXAutoreleasingStackPopObjectsUntilNULL(FXAutoreleasingStack *stack) {
	return 0;
}

bool FXAutoreleasingStackIsEmpty(FXAutoreleasingStack *stack) {
	return false;
}

bool FXAutoreleasingStackIsFull(FXAutoreleasingStack *stack) {
	return false;
}

#pragma mark -
#pragma mark Private Implementations

void **FXAutoreleasingStackGetData(FXAutoreleasingStack *stack) {
	return NULL;
}

void *FXAutoreleasingStackGetHead(FXAutoreleasingStack *stack) {
	return NULL;
}

void FXAutoreleasingStackSetHead(FXAutoreleasingStack *stack, void *head) {
	
}

size_t FXAutoreleasingStackGetSize(FXAutoreleasingStack *stack) {
	return 0;
}

void FXAutoreleasingStackSetSize(FXAutoreleasingStack *stack, size_t size) {
	
}
