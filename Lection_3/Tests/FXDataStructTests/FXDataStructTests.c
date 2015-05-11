//
//  FXDataStructTests.c
//  Lection_3
//
//  Created by Basil Nikityuk on 5/10/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

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
	printf("offset of (stuct Unsorted_t, s1) is %lu\n", offsetof(Unsorted_t, s1));
	printf("offset of (stuct Unsorted_t, s2) is %lu\n", offsetof(Unsorted_t, s2));
	printf("offset of (stuct Unsorted_t, i1) is %lu\n", offsetof(Unsorted_t, i1));
	printf("offset of (stuct Unsorted_t, s3) is %lu\n", offsetof(Unsorted_t, s3));
	printf("offset of (stuct Unsorted_t, ll1) is %lu\n", offsetof(Unsorted_t, ll1));
	printf("offset of (stuct Unsorted_t, f1) is %lu\n", offsetof(Unsorted_t, f1));
	printf("offset of (stuct Unsorted_t, b1) is %lu\n", offsetof(Unsorted_t, b1));
	printf("offset of (stuct Unsorted_t, b2) is %lu\n", offsetof(Unsorted_t, b2));
	printf("offset of (stuct Unsorted_t, b3) is %lu\n", offsetof(Unsorted_t, b3));
	printf("offset of (stuct Unsorted_t, b4) is %lu\n", offsetof(Unsorted_t, b4));
	printf("offset of (stuct Unsorted_t, b5) is %lu\n", offsetof(Unsorted_t, b5));
	printf("offset of (stuct Unsorted_t, d1) is %lu\n", offsetof(Unsorted_t, d1));
	printf("offset of (stuct Unsorted_t, b6) is %lu\n", offsetof(Unsorted_t, b6));
	printf("offset of (stuct Unsorted_t, str1) is %lu\n", offsetof(Unsorted_t, str1));
}
