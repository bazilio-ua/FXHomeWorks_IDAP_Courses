//
//  FXString.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/6/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>

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
		size_t oldLength = FXStringGetLength(string);
		if (NULL != data) { // set new data value
			size_t length = strlen(data);
			size_t size = length * sizeof(*string->_data);
			if (NULL == string->_data) { // if string->_data is NULL
				string->_data = malloc(size); // we need to allocate some memory
			} else if (length != oldLength) { // if string->_data was already set and new string has differ length
				string->_data = realloc(string->_data, size); // or reallocate it
			}
			assert(NULL != string->_data); // make sure allocation is successfull  
			
			memmove(string->_data, data, length);
		} else if (NULL != string->_data) { // if (NULL == data)
			free(string->_data);
			string->_data = NULL;
		}
	}
}

char *FXStringGetString(FXString *string) {
	if (NULL != string) {
		return string->_data;
	}
	
	return NULL;
}

size_t FXStringGetLength(FXString *string) {
	if (NULL != string && NULL != string->_data) {
		return strlen(string->_data);
	}
	
	return 0;
}

#pragma mark -
#pragma mark Private Accessors Implementation
