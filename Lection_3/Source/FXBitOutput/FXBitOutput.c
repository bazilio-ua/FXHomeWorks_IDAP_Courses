//
//  FXBitOutput.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/11/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <stdbool.h>

#include "FXBitOutput.h"

#pragma mark -
#pragma mark Private Declaration

static const unsigned char kFXBitCount = 8; // size of byte
static const unsigned char kFXByteMask = 1 << (kFXBitCount - 1); // 128

static
bool FXisLittleEndian(void);

#pragma mark -
#pragma mark Public Implementation

void FXByteValueOutput(char *byteAddress) {
    for (unsigned char shiftByteMask = kFXByteMask; shiftByteMask > 0; shiftByteMask >>= 1) {
		printf("%d", (*byteAddress & shiftByteMask) ? 1 : 0);
		if (shiftByteMask != 1) {
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

void FXBitFieldValueOutputRev(void *byteAddress, size_t size) { // *void is for various types (universal method)
	printf("{");
//	char *bitfieldAddress = (char *)byteAddress + size - 1; // cast out types to *char
	
	for (unsigned short index = 0; index < size; index++) {
		char byte = ((char *)byteAddress)[index];
		
		FXByteValueOutput(&byte);		
//		FXByteValueOutput(bitfieldAddress);
//		bitfieldAddress--;
		printf(", ");
	}
	printf("}");
}


#pragma mark -
#pragma mark Private Implementation

bool FXisLittleEndian(void) {
	unsigned short byteorder = 1; /* 0x0001 */
	if ( *((unsigned char *) &byteorder) == 1 ) {
		return true;
	} else {
		return false;
	}
}
