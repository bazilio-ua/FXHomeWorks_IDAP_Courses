//
//  FXDataStruct.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/10/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef FXHomeWorks_FXDataStruct_h
#define FXHomeWorks_FXDataStruct_h

#include <stdbool.h> // for bool
#include <stdint.h>

typedef struct Unsorted {
	short shortVar1;
	short shortVar2;
	int intVar1;
	short shortVar3;
	long longVar1;
	long long longlongVar1;
	float floatVar1;
	bool boolVar1;
	bool boolVar2;
	bool boolVar3;
	bool boolVar4;
	bool boolVar5;
	double doubleVar1;
	bool boolVar6;
	char *stringVar1;
} Unsorted_t;

typedef struct Sorted {
	double doubleVar1;
	long long longlongVar1;
	long longVar1;
	float floatVar1;
	int intVar1;
	short shortVar1;
	short shortVar2;
	short shortVar3;
	char *stringVar1;
	bool boolVar1;
	bool boolVar2;
	bool boolVar3;
	bool boolVar4;
	bool boolVar5;
	bool boolVar6;
} Sorted_t;

typedef struct Sorted_Union {
	double doubleVar1;
	long long longlongVar1;
	long longVar1;
	float floatVar1;
	int intVar1;
	char *stringVar1;
	
	short shortVar1;
	short shortVar2;
	short shortVar3;
	
	union {
		struct { // bit-field
			bool boolVar1:1;
			bool boolVar2:1;
			bool boolVar3:1;
			bool boolVar4:1;
			bool boolVar5:1;
			bool boolVar6:1;
		};
		uint8_t bitFields;
	};
} Sorted_Union_t;

#endif
