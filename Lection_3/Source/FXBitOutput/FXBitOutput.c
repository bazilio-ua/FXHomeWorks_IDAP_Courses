//
//  FXBitOutput.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/11/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include "FXBitOutput.h"

#pragma mark -
#pragma mark Private Declaration

static const unsigned char kFXBitCount = 8;

#pragma mark -
#pragma mark Public Implementation

void FXByteValueOutput(char *byteAddress) {
	unsigned char value = *byteAddress; // cache value from address
	for (unsigned char shiftBitCount = kFXBitCount; shiftBitCount > 0; shiftBitCount--) { // start from least? most significant bit
		unsigned char shiftedValue = value >> (shiftBitCount - 1); // bitwise right-shifted of value by bit count
		printf("%d", (shiftedValue & 1));
		if (shiftBitCount != 1) {
			printf(" ");
		}
	}
}

void FXBitFieldValueOutput(void *byteAddress, size_t size) { // *void is for various types (universal method)
	printf("{");
	char *bitfieldAddress = (char *)byteAddress + size - 1; // cast out types to *char
	for (unsigned short index = 0; index < size; index++) {
		FXByteValueOutput(bitfieldAddress);
		bitfieldAddress--;
		printf(", ");
	}
	printf("}");
}

#pragma mark -
#pragma mark Private Implementation
