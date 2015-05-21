//
//  FXHuman.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef FXHomeWorks_FXHuman_h
#define FXHomeWorks_FXHuman_h

#include "FXObject.h"

typedef enum {
	kFXHumanGenderUndefined,
	kFXHumanGenderMale,
	kFXHumanGenderFemale
} FXHumanGender;

typedef struct FXHuman FXHuman;

extern
FXHuman *FXHumanCreateWithParameters(char *name, int age, FXHumanGender gender);

extern
void __FXHumanDeallocate(FXHuman *human);

extern
void FXHumanSetName(FXHuman *human, char *name);

extern
char *FXHumanGetName(FXHuman *human);

extern
void FXHumanSetAge(FXHuman *human, int age);

extern
int FXHumanGetAge(FXHuman *human);

// marriage
extern
void FXHumanMarriage(FXHuman *human, FXHuman *spouse);

// divorce
extern
void FXHumanDivorce(FXHuman *human);

// children
extern
FXHuman *FXHumanCreateChildWithParameters(FXHuman *human, char *name, int age, FXHumanGender gender);

#endif
