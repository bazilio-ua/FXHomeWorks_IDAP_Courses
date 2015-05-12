//
//  FXBitOutput.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/11/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef FXHomeWorks_FXBitOutput_h
#define FXHomeWorks_FXBitOutput_h

#include <stdio.h>
#include <stdbool.h>

extern
void FXByteValueOutput(char *byteAddress);

extern
void FXBitFieldValueOutput(void *byteAddress, size_t size);

extern
void FXBitFieldValueOutputRev(void *byteAddress, size_t size);

#endif
