//
//  FXPrimitiveOutputType.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/6/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef FXHomeWorks_FXPrimitiveOutputType_h
#define FXHomeWorks_FXPrimitiveOutputType_h

#include <stdio.h>

#define FXPrimitiveOutputGenerateType(type, specificator) \
	void output_##type(type value); \
	void output_##type(type value) { \
		printf(#type " value = " #specificator "\n", value); \
	}

#define FXPrimitiveOutputValueType(type, value) \
	output_##type(value);

#endif
