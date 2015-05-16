//
//  FXTestsMacro.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/16/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef FXHomeWorks_FXTestsMacro_h
#define FXHomeWorks_FXTestsMacro_h

extern
void _FXPerformTestPrintHeader(void);

extern
void _FXPerformTestPrintFooter(void);

#define performTest(testFunction) \
do { \
	_FXPerformTestPrintHeader(); \
	printf(" %s started...\n", #testFunction); \
	testFunction(); \
	_FXPerformTestPrintFooter(); \
	printf(" %s ...finished\n", #testFunction); \
} while(0)

#endif
