//
//  FXDataStructTests.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/10/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <stddef.h> // for offsetof

#include "FXDataStructTests.h"
#include "FXDataStruct.h"

#pragma mark -
#pragma mark Private Declaration

static
void FXDataStructOutputSizeTests(void);

static
void FXDataStructOutputOffsetOfTests(void);

#pragma mark -
#pragma mark Public Implementation

void FXDataStructTests(void) {
	FXDataStructOutputSizeTests();
	FXDataStructOutputOffsetOfTests();
}

#pragma mark -
#pragma mark Private Implementation

void FXDataStructOutputSizeTests(void) {
	printf("Struct sizes:\n");
	printf("\tUnsorted - %lu bytes\n", sizeof( Unsorted_t ));
	printf("\tSorted - %lu bytes\n", sizeof( Sorted_t ));
	printf("\tSorted with Union - %lu bytes\n", sizeof( Sorted_Union_t ));
}

void FXDataStructOutputOffsetOfTests(void) {
	printf("Struct's elements placement:\n");
	printf("offset of (stuct Unsorted_t, shortVar1) is %lu\n", offsetof(Unsorted_t, shortVar1));
	printf("offset of (stuct Unsorted_t, shortVar2) is %lu\n", offsetof(Unsorted_t, shortVar2));
	printf("offset of (stuct Unsorted_t, intVar1) is %lu\n", offsetof(Unsorted_t, intVar1));
	printf("offset of (stuct Unsorted_t, shortVar3) is %lu\n", offsetof(Unsorted_t, shortVar3));
	printf("offset of (stuct Unsorted_t, longVar1) is %lu\n", offsetof(Unsorted_t, longVar1));
	printf("offset of (stuct Unsorted_t, longlongVar1) is %lu\n", offsetof(Unsorted_t, longlongVar1));
	printf("offset of (stuct Unsorted_t, floatVar1) is %lu\n", offsetof(Unsorted_t, floatVar1));
	printf("offset of (stuct Unsorted_t, boolVar1) is %lu\n", offsetof(Unsorted_t, boolVar1));
	printf("offset of (stuct Unsorted_t, boolVar2) is %lu\n", offsetof(Unsorted_t, boolVar2));
	printf("offset of (stuct Unsorted_t, boolVar3) is %lu\n", offsetof(Unsorted_t, boolVar3));
	printf("offset of (stuct Unsorted_t, boolVar4) is %lu\n", offsetof(Unsorted_t, boolVar4));
	printf("offset of (stuct Unsorted_t, boolVar5) is %lu\n", offsetof(Unsorted_t, boolVar5));
	printf("offset of (stuct Unsorted_t, doubleVar1) is %lu\n", offsetof(Unsorted_t, doubleVar1));
	printf("offset of (stuct Unsorted_t, boolVar6) is %lu\n", offsetof(Unsorted_t, boolVar6));
	printf("offset of (stuct Unsorted_t, stringVar1) is %lu\n", offsetof(Unsorted_t, stringVar1));
}
