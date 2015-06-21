//
//  FXLinkedListNode.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/21/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef FXHomeWorks_FXLinkedListNode_h
#define FXHomeWorks_FXLinkedListNode_h

#include "FXObject.h"

typedef struct FXLinkedListNode FXLinkedListNode;

// dealloc
extern
void __FXLinkedListNodeDeallocate(void *object);

extern
FXLinkedListNode *FXLinkedListNodeCreateWithObject(void *object);

extern
FXLinkedListNode *FXLinkedListNodeGetNextNode(FXLinkedListNode *node);

extern
void FXLinkedListNodeSetNextNode(FXLinkedListNode *node, FXLinkedListNode *nextNode);

extern
void *FXLinkedListNodeGetObject(FXLinkedListNode *node);

extern
void FXLinkedListNodeSetObject(FXLinkedListNode *node, void *object);

#endif
