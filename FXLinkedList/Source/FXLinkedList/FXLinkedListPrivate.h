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

typedef struct FXLinkedListNode FXLinkedListNode;

// Special Purposes accessors (TODO: move it to special 'private' header)
extern
void FXLinkedListSetHead(FXLinkedList *list, FXLinkedListNode *head);

extern
FXLinkedListNode *FXLinkedListGetHead(FXLinkedList *list);

extern
void FXLinkedListSetMutationsCount(FXLinkedList *list, uint64_t mutationsCount);

extern
uint64_t FXLinkedListGetMutationsCount(FXLinkedList *list);

#endif
