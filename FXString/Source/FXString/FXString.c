//
//  FXString.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/6/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <string.h>

#include "FXString.h"

#pragma mark -
#pragma mark Private Declaration

struct FXString {
	FXObject _super; // inheritance from FXObject
	
	char *_data;
};

#pragma mark -
#pragma mark Public Methods Implementation

// dealloc
void __FXStringDeallocate(FXString *string) {
	FXStringSetString(string, NULL);
	
	__FXObjectDeallocate(string);
}

FXString *FXStringCreateWithParameters(const char *data) {
	FXString *string = FXObjectCreateOfType(FXString);
	FXStringSetString(string, data);

	return string;
}

void FXStringSetString(FXString *string, const char *data) {
	if (NULL != string) {
		if (NULL != data) {
			size_t length = strlen(data);
			memmove(FXStringGetString(string), data, length);
		} else { // if (NULL == data)
			memset(FXStringGetString(string), 0, FXStringGetStringLength(string));
		}
	}
}

char *FXStringGetString(FXString *string) {
	if (NULL != string) {
		return string->_data;
	}
	
	return NULL;
}

size_t FXStringGetStringLength(FXString *string) {
	if (NULL != string) {
		return strlen(string->_data);
	}
	
	return 0;
}

#pragma mark -
#pragma mark Private Accessors Implementation
