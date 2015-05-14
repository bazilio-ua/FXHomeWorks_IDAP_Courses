//
//  FXBitOutput.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/11/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#include "FXBitOutput.h"

#pragma mark -
#pragma mark Private Declaration

static const unsigned char kFXBitCount = 8; // size of byte
static const unsigned char kFXByteMask = 1 << (kFXBitCount - 1); // 128

static
FXByteOrder FXDetectByteOrder(void);

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

void FXBitFieldValueOutput(void *byteAddress, size_t size, FXByteOrder setOrder) {
	FXByteOrder detectedOrder = FXDetectByteOrder();
	
	if (detectedOrder == kFXLittleEndian) {
		printf("Little-endian byte order\n");
		printf("{");
		for (unsigned short index = size; index > 0; index--) {
			FXByteValueOutput(&((char *)byteAddress)[index - 1]);
			if (index != 1) {
				printf(", ");
			}
		}
		printf("}");
	} else if (detectedOrder == kFXBigEndian) {
		printf("Big-endian byte order\n");
		printf("{");
		for (unsigned short index = 0; index < size; index++) {
			FXByteValueOutput(&((char *)byteAddress)[index]);
			if (index != size - 1) {
				printf(", ");
			}
		}
		printf("}");
	} else {
		printf("Unsupported byte order\n");
	}
}

#pragma mark -
#pragma mark Private Implementation

FXByteOrder FXDetectByteOrder(void) {
	unsigned int byteOrder = 0x12345678;
                             /* U N I X */

/*
LE  order: 78 56 34 12
            X  I  N  U

PDP order: 34 12 78 56
            N  U  X  I

BE  order: 12 34 56 78
            U  N  I  X
*/

	if ( *(char *)&byteOrder == 0x78 ) {
		return kFXLittleEndian;
	} else if ( *(char *)&byteOrder == 0x34 ) {
		return kFXPDPEndian;
	} else if ( *(char *)&byteOrder == 0x12 ) {
		return kFXBigEndian;
	} else {
		return kFXUnknownEndian;
	}
}
