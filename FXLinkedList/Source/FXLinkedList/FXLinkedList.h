//
//  FXLinkedList.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef FXHomeWorks_FXLinkedList_h
#define FXHomeWorks_FXLinkedList_h

#include <stdbool.h>

#include "FXObject.h"

typedef struct FXLinkedList FXLinkedList;

// dealloc
extern
void __FXLinkedListDeallocate(FXLinkedList *list);

extern
void *FXLinkedListGetFirstObject(FXLinkedList *list);

extern
void FXLinkedListRemoveFirstObject(FXLinkedList *list);

extern
void *FXLinkedListGetObjectBeforeObject(FXLinkedList *list, void *object);

extern
bool FXLinkedListIsEmpty(FXLinkedList *list);

extern
void FXLinkedListAddObject(FXLinkedList *list, void *object);

extern
void FXLinkedListRemoveObject(FXLinkedList *list, void *object);

extern
void FXLinkedListRemoveAllObject(FXLinkedList *list);

extern
bool FXLinkedListContainsObject(FXLinkedList *list, void *object);

extern
uint64_t FXLinkedListGetCount(FXLinkedList *list);

#endif
