//
//  FXLinkedListNode.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/21/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#include "FXLinkedListNode.h"

#pragma mark -
#pragma mark Private Declarations

struct FXLinkedListNode {
	FXObject _super; // inheritance from FXObject
	
	FXLinkedListNode *_nextNode;
	void *_object; // void here is because we don't wanna to cast types to FXObject every time
};

#pragma mark -
#pragma mark Public Methods Implementations

#pragma mark -
#pragma mark Private Accessors Implementation
