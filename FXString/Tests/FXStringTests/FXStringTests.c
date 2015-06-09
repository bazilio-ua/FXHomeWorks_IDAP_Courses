//
//  FXStringTests.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/6/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <assert.h>
#include <string.h>

#include "FXStringTests.h"
#include "FXString.h"

void FXStringTests(void) {
	//	after creation a string object
	FXString *string = FXStringCreateWithParameters("The quick brown fox jumps over the lazy dog");
	//		pointer to it should be not NULL
	assert(NULL != string);
	//		reference count must be equal 1
	assert(1 == FXObjectGetReferenceCount(string));
	//		string length should be not 0
	assert(0 != FXStringGetStringLength(string));
	//		print string
	printf("FXString %p contain string '%s' with length '%lu'\n", 
		   string, 
		   FXStringGetString(string), 
		   FXStringGetStringLength(string));
	
	//		cache text from our string
	char *text = FXStringGetString(string);
	//		set the same string again
	FXStringSetString(string, "The quick brown fox jumps over the lazy dog");
	//		string must be identical
	assert(0 == strcmp(text, FXStringGetString(string)));
	//		print string
	printf("FXString %p contain the same string '%s' with length '%lu'\n", 
		   string, 
		   FXStringGetString(string), 
		   FXStringGetStringLength(string));
	
	//		cache length from our string
	size_t length = FXStringGetStringLength(string);
	//		set the another string with the same length
	FXStringSetString(string, "The brown quick fox over jumps the dog lazy");
	//		length must be the same
	assert(length == FXStringGetStringLength(string));
	//		print string
	printf("FXString %p contain another string '%s' with same length '%lu'\n", 
		   string, 
		   FXStringGetString(string), 
		   FXStringGetStringLength(string));
	
	
	//		after retain
	FXObjectRetain(string);
	//		reference count must be equal 2
	assert(2 == FXObjectGetReferenceCount(string));
	//		after release
	FXObjectRelease(string);
	//		reference count must be equal 1
	assert(1 == FXObjectGetReferenceCount(string));
	
	
	//	after set new text
	FXStringSetString(string, "THE QUICK BROWN FOX JUMPED OVER THE LAZY DOG'S BACK 1234567890");
	//		pointer to it should be not NULL
	assert(NULL != string);
	//		reference count must be equal 1
	assert(1 == FXObjectGetReferenceCount(string));
	//		string length should be not 0
	assert(0 != FXStringGetStringLength(string));
	//		print new string
	printf("FXString %p contain new string '%s' with length '%lu'\n", 
		   string, 
		   FXStringGetString(string), 
		   FXStringGetStringLength(string));
	
	
	//	after set text to NULL
	FXStringSetString(string, NULL);
	//		pointer to it should be not NULL
	assert(NULL != string);
	//		reference count must be equal 1
	assert(1 == FXObjectGetReferenceCount(string));
	//		string length should be equal 0
	assert(0 == FXStringGetStringLength(string));
	//		print NULL string
	printf("FXString %p contain NULL string '%s' with length '%lu'\n", 
		   string, 
		   FXStringGetString(string), 
		   FXStringGetStringLength(string));
	
	
	//	after set very new text
	FXStringSetString(string, "The following sentence makes a good copy for practice, as it contains every letter of the alphabet: 'A quick brown fox jumps over the lazy dog.'");
	//		pointer to it should be not NULL
	assert(NULL != string);
	//		reference count must be equal 1
	assert(1 == FXObjectGetReferenceCount(string));
	//		string length should be not 0
	assert(0 != FXStringGetStringLength(string));
	//		print new string
	printf("FXString %p contain very new string '%s' with length '%lu'\n", 
		   string, 
		   FXStringGetString(string), 
		   FXStringGetStringLength(string));
	
	// release it
	FXObjectRelease(string);
}
