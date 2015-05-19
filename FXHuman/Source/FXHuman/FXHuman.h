//
//  FXHuman.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef FXHomeWorks_FXHuman_h
#define FXHomeWorks_FXHuman_h

#include <stdbool.h>

#include "FXObject.h"

typedef enum {
	kFXHumanGenderUndefined,
	kFXHumanGenderMale,
	kFXHumanGenderFemale
} FXHumanGender;

typedef struct FXHuman FXHuman;

extern
FXHuman *FXHumanCreateWithParameters(char *name, FXHumanGender gender);

extern
void __FXHumanDeallocate(FXHuman *human);

// marriage
void FXHumanMarriage(FXHuman *human, FXHuman *spouse);

// divorce
void FXHumanDivorce(FXHuman *human);

// children
extern
FXHuman *FXHumanCreateChild(FXHuman *human);

extern
int FXHumanGetChildrenCount(FXHuman *human);

#endif
