//
//  FXDataStructTests.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/10/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <stddef.h> // for offsetof

#include "FXTestsMacro.h"

#include "FXDataStructTests.h"
#include "FXDataStruct.h"

#pragma mark -
#pragma mark Private Declaration

static
void FXDataStructSizeOutputTests(void);

static
void FXDataStructOffsetOfOutputTests(void);

#define FXDataStructOffsetOfPrint(structure, element) \
	printf("\tstucture '" #structure "' has element '" #element"' with size: %lu and offset: %lu\n", \
	sizeof(((structure *)0)->element), \
	offsetof(structure, element))

#pragma mark -
#pragma mark Public Implementation

void FXDataStructTests(void) {
	performTest(FXDataStructSizeOutputTests);
	performTest(FXDataStructOffsetOfOutputTests);
}

#pragma mark -
#pragma mark Private Implementation

void FXDataStructSizeOutputTests(void) {
	printf("Struct sizes:\n");
	printf("\tUnsorted - %lu bytes\n", sizeof( Unsorted_t ));
	printf("\tSorted - %lu bytes\n", sizeof( Sorted_t ));
	printf("\tSorted with Union - %lu bytes\n", sizeof( Sorted_Union_t ));

	printf("\tsizeof Sorted_Union_t->intVar1 - %lu bytes\n", sizeof( ((Sorted_Union_t *)0)->intVar1 )); // take size by address ptr
	printf("\tsizeof Sorted_Union_t.intVar1 - %lu bytes\n", sizeof( ((Sorted_Union_t){0}).intVar1 )); // take size by variable
}

void FXDataStructOffsetOfOutputTests(void) {
	printf("Struct's elements placement:\n");
	FXDataStructOffsetOfPrint(Unsorted_t, shortVar1);
	FXDataStructOffsetOfPrint(Unsorted_t, shortVar2);
	FXDataStructOffsetOfPrint(Unsorted_t, intVar1);
	FXDataStructOffsetOfPrint(Unsorted_t, shortVar3);
	FXDataStructOffsetOfPrint(Unsorted_t, longVar1);
	FXDataStructOffsetOfPrint(Unsorted_t, longlongVar1);
	FXDataStructOffsetOfPrint(Unsorted_t, floatVar1);
	FXDataStructOffsetOfPrint(Unsorted_t, boolVar1);
	FXDataStructOffsetOfPrint(Unsorted_t, boolVar2);
	FXDataStructOffsetOfPrint(Unsorted_t, boolVar3);
	FXDataStructOffsetOfPrint(Unsorted_t, boolVar4);
	FXDataStructOffsetOfPrint(Unsorted_t, boolVar5);
	FXDataStructOffsetOfPrint(Unsorted_t, doubleVar1);
	FXDataStructOffsetOfPrint(Unsorted_t, boolVar6);
	FXDataStructOffsetOfPrint(Unsorted_t, stringVar1);
}
