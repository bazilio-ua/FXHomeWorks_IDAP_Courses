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

// dealloc
extern
void __FXHumanDeallocate(FXHuman *human);

extern
FXHuman *FXHumanCreateWithParameters(char *name, int age, FXHumanGender gender);

// marriage
extern
void FXHumanMarriage(FXHuman *human, FXHuman *wed);

// divorce
extern
void FXHumanDivorce(FXHuman *human);

// children
extern
FXHuman *FXHumanCreateChildWithParameters(FXHuman *human, char *name, int age, FXHumanGender gender);

extern
FXHuman *FXHumanGetChildAtIndex(FXHuman *human, unsigned int index);

extern
void FXHumanAddChild(FXHuman *human, FXHuman *child);

extern
int FXHumanGetChildrenCount(FXHuman *human);

// name
extern
void FXHumanSetName(FXHuman *human, const char *name);

extern
char *FXHumanGetName(FXHuman *human);

// age
extern
void FXHumanSetAge(FXHuman *human, int age);

extern
int FXHumanGetAge(FXHuman *human);

// gender
extern
FXHumanGender FXHumanGetGender(FXHuman *human);

// spouse
extern
FXHuman *FXHumanGetSpouse(FXHuman *human);

// parents
extern
FXHuman *FXHumanGetMother(FXHuman *human);

extern
FXHuman *FXHumanGetFather(FXHuman *human);

#endif
