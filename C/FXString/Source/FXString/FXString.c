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
	FXStringSetData(string, NULL);
	
	__FXObjectDeallocate(string);
}

FXString *FXStringCreateWithParameters(const char *data) {
	FXString *string = FXObjectCreateOfType(FXString);
	FXStringSetData(string, data);
	
	return string;
}

void FXStringSetData(FXString *string, const char *data) {
	if (NULL != string) {
		size_t previousLength = FXStringGetLength(string);
		char *previousData = FXStringGetData(string);
		if (NULL != data) { // set new data value
			size_t length = strlen(data) + 1; // + 1 is for terminating `\0'
			size_t size = length * sizeof(*string->_data);
			if (NULL == previousData) { // if string->_data is NULL
				string->_data = malloc(size); // we need to allocate some memory
			} else if (length != previousLength) { // if string->_data was already set and new string has differ length
				string->_data = realloc(string->_data, size); // or reallocate it
			}
			assert(NULL != string->_data); // make sure allocation is successfull  
			
			memmove(string->_data, data, length);
		} else if (NULL != previousData) { // if (NULL == data)
			free(string->_data);
			string->_data = NULL;
		}
	}
}

char *FXStringGetData(FXString *string) {
	if (NULL != string) {
		return string->_data;
	}
	
	return NULL;
}

size_t FXStringGetLength(FXString *string) {
	if (NULL != string && NULL != string->_data) {
		return strlen(string->_data) + 1; // + 1 is for terminating `\0'
	}
	
	return 0;
}

#pragma mark -
#pragma mark Private Accessors Implementation
