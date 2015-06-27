//
//  FXLinkedListPrivate.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/27/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef FXHomeWorks_FXLinkedListPrivate_h
#define FXHomeWorks_FXLinkedListPrivate_h

#include "FXLinkedList.h"
#include "FXLinkedListNode.h"

typedef struct FXLinkedListNodeContext FXLinkedListNodeContext;

// define signature for comparator func callback
typedef bool (*FXLinkedListNodeComparatorFunction)(FXLinkedListNode *node, FXLinkedListNodeContext context);

// Special Purposes 'Private' accessors
extern
void FXLinkedListSetHead(FXLinkedList *list, FXLinkedListNode *head);

extern
FXLinkedListNode *FXLinkedListGetHead(FXLinkedList *list);

extern
void FXLinkedListSetMutationsCount(FXLinkedList *list, uint64_t mutationsCount);

extern
uint64_t FXLinkedListGetMutationsCount(FXLinkedList *list);

// Special Purposes 'Search by Context'
extern
FXLinkedListNode *FXLinkedListGetNodeWithContext(FXLinkedList *list, 
												 FXLinkedListNodeComparatorFunction comparator, 
												 FXLinkedListNodeContext *context);
extern
bool FXLinkedListNodeContainsObject(FXLinkedListNode *node, FXLinkedListNodeContext context);

#endif
