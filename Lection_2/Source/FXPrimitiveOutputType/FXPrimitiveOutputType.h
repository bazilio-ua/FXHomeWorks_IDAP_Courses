//
//  FXPrimitiveOutputType.h
//  Lection_2
//
//  Created by Basil Nikityuk on 5/6/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef Lection_2_FXPrimitiveOutputType_h
#define Lection_2_FXPrimitiveOutputType_h

#include <stdio.h>

#define FXPrimitiveOutputGenerateType(type, specificator) \
	void output_##type(type value); \
	void output_##type(type value) { \
		printf(#type " value = " #specificator "\n", value); \
	}

#define FXPrimitiveOutputValueType(type, value) \
	output_##type(value);

#endif
