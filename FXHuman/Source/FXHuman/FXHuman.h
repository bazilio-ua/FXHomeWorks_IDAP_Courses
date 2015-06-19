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
FXHuman *FXHumanCreateWithParameters(char *name, uint32_t age, FXHumanGender gender);

// marriage
extern
void FXHumanMarriage(FXHuman *human, FXHuman *wed);

// divorce
extern
void FXHumanDivorce(FXHuman *human);

// children
extern
FXHuman *FXHumanCreateChildWithParameters(FXHuman *human, char *name, uint32_t age, FXHumanGender gender);

extern
FXHuman *FXHumanGetChildAtIndex(FXHuman *human, uint32_t index);

extern
void FXHumanAddChild(FXHuman *human, FXHuman *child);

extern
uint32_t FXHumanGetChildrenCount(FXHuman *human);

// name
extern
void FXHumanSetName(FXHuman *human, const char *name);

extern
char *FXHumanGetName(FXHuman *human);

// age
extern
void FXHumanSetAge(FXHuman *human, uint32_t age);

extern
uint32_t FXHumanGetAge(FXHuman *human);

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
