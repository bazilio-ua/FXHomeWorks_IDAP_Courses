//
//  FXDataStruct.h
//  Lection_3
//
//  Created by Basil Nikityuk on 5/10/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef Lection_3_FXDataStruct_h
#define Lection_3_FXDataStruct_h

#include <stdio.h>
#include <stdbool.h>

struct Unsorted {
	short s1;
	short s2;
	int i1;
	short s3;
	long long l1;
	float f1;
	bool b1;
	bool b2;
	bool b3;
	bool b4;
	bool b5;
	double d1;
	bool b6;
	char *str;
};

struct Sorted {
	char *str;
	bool b1;
	bool b2;
	bool b3;
	bool b4;
	bool b5;
	bool b6;
	short s1;
	short s2;
	short s3;
	int i1;
	float f1;
	long long l1;
	double d1;
};

struct Sorted_Union {
	short s1;
	short s2;
	short s3;
	
	union {
		struct { // bit-field
			bool b1 : 1;
			bool b2 : 1;
			bool b3 : 1;
			bool b4 : 1;
			bool b5 : 1;
			bool b6 : 1;
		};
		char *str;
		int i1;
		float f1;
		long long l1;
		double d1;
	};
};

#endif
