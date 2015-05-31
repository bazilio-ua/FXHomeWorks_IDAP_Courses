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

extern
void FXHumanSetGender(FXHuman *human, FXHumanGender gender);

extern
FXHumanGender FXHumanGetGender(FXHuman *human);

// spouse
extern
void FXHumanSetSpouse(FXHuman *human, FXHuman *spouse);

extern
FXHuman *FXHumanGetSpouse(FXHuman *human);
/*
extern
void FXHumanDeletePartnerFromSpouse(FXHuman *human);
*/
// parents
extern
void FXHumanSetMother(FXHuman *human, FXHuman *mother);

extern
FXHuman *FXHumanGetMother(FXHuman *human);

extern
void FXHumanSetFather(FXHuman *human, FXHuman *father);

extern
FXHuman *FXHumanGetFather(FXHuman *human);

extern
bool FXHumanIsMarried(FXHuman *human);

// marriage
extern
bool FXHumanMarriage(FXHuman *human, FXHuman *wed);

// divorce
extern
void FXHumanDivorce(FXHuman *human);

// children
extern
FXHuman *FXHumanCreateChildWithParameters(FXHuman *human, char *name, int age, FXHumanGender gender);

extern
void FXHumanAddChild(FXHuman *human, FXHuman *child);

extern
void FXHumanRemoveChild(FXHuman *human, FXHuman *child);

extern
void FXHumanDeleteChildFromParent(FXHuman *human, FXHuman *child);

extern
void FXHumanDeleteParentFromChild(FXHuman *human);

extern
void FXHumanDeleteChildren(FXHuman *human);

extern
int FXHumanGetChildrenCount(FXHuman *human);

#endif
