//
//  FXSizeOfTypeOutput.h
//  Lection_1
//
//  Created by Basil Nikityuk on 5/4/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef Lection_1_FXSizeOfTypeOutput_h
#define Lection_1_FXSizeOfTypeOutput_h

#include <stdio.h>

#define FXSizeOfTypePrint(type) \
	printf("type '%s' has size = %lu\n", #type, sizeof(type))

#endif
