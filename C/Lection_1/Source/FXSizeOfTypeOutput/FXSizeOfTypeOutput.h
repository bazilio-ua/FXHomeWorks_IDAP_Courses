//
//  FXSizeOfTypeOutput.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/4/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef FXHomeWorks_FXSizeOfTypeOutput_h
#define FXHomeWorks_FXSizeOfTypeOutput_h

#include <stdio.h>

#define FXSizeOfTypePrint(type) \
	printf("type '%s' has size = %lu\n", #type, sizeof(type))

#endif
