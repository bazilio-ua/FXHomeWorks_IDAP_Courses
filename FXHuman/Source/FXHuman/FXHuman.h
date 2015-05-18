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

typedef enum {
	kFXumanStatusUndefined,
	kFXumanStatusSingle,
	kFXumanStatusMarried,
	kFXumanStatusDivorced
} FXHumanMaritalStatus;

typedef struct FXHuman FXHuman;

struct FXHuman {
	FXObject _super; // inheritance from FXObject
	
	char *_name;
	FXHumanGender _gender;
	int _age;
	
	bool _isAlive;
	FXHumanMaritalStatus _maritalStatus;
	
	FXHuman *_mother;
	FXHuman *_father;
	FXHuman *_spouse;
//	FXHuman **_children;
//	FXHuman **_friends;
	FXHuman *_children[20];
	FXHuman *_friends[20];
};

#pragma mark -
#pragma mark Public Accessors

extern
FXHuman *FXHumanCreate(char *name, FXHumanGender gender);

extern
void __FXHumanDeallocate(FXHuman *human);

extern
void FXHumanRelease(FXHuman *human);

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

extern
void FXHumanSetIsAlive(FXHuman *human, bool alive);

extern
bool FXHumanGetIsAlive(FXHuman *human);

extern
void FXHumanSetMaritalStatus(FXHuman *human, FXHumanMaritalStatus status);

extern
FXHumanMaritalStatus FXHumanGetMaritalStatus(FXHuman *human);

// spouse
extern
void FXHumanSetSpouse(FXHuman *human, FXHuman *spouse);

extern
FXHuman *FXHumanGetSpouse(FXHuman *human);

// parents
extern
void FXHumanSetMother(FXHuman *human, FXHuman *mother);

extern
FXHuman *FXHumanGetMother(FXHuman *human);

extern
void FXHumanSetFather(FXHuman *human, FXHuman *father);

extern
FXHuman *FXHumanGetFather(FXHuman *human);

// children
extern
FXHuman *FXHumanCreateChild(FXHuman *human, FXHuman *spouse);

extern
int FXHumanGetChildrenCount(FXHuman *human);

// friends
extern
FXHuman *FXHumanAddFriend(FXHuman *human, FXHuman *newFriend);

extern
int FXHumanGetFriendsCount(FXHuman *human);

#endif
