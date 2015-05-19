//
//  FXHuman.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <assert.h>
#include <string.h>

#include "FXHuman.h"

#pragma mark -
#pragma mark Private Declaration

static const int kFXMaxNameLength = 64;
static const int kFXMaxChildrenCount = 20;

struct FXHuman {
	FXObject _super; // inheritance from FXObject
	
	char _name[kFXMaxNameLength];
	FXHumanGender _gender;
	int _age;
	
	FXHuman *_mother;
	FXHuman *_father;
	FXHuman *_spouse;
	
	FXHuman *_children[kFXMaxChildrenCount];
	int _childrenCount;
};

static
void FXHumanSetName(FXHuman *human, char *name);

static
char *FXHumanGetName(FXHuman *human);

static
void FXHumanSetAge(FXHuman *human, int age);

static
int FXHumanGetAge(FXHuman *human);

static
void FXHumanSetGender(FXHuman *human, FXHumanGender gender);

static
FXHumanGender FXHumanGetGender(FXHuman *human);

// spouse
static
void FXHumanSetSpouse(FXHuman *human, FXHuman *spouse);

static
FXHuman *FXHumanGetSpouse(FXHuman *human);

// parents
static
void FXHumanSetMother(FXHuman *human, FXHuman *mother);

static
FXHuman *FXHumanGetMother(FXHuman *human);

static
void FXHumanSetFather(FXHuman *human, FXHuman *father);

static
FXHuman *FXHumanGetFather(FXHuman *human);

#pragma mark -
#pragma mark Public Methods Implementation

FXHuman *FXHumanCreateWithParameters(char *name, FXHumanGender gender) {
	FXHuman *human = FXObjectCreateOfType(FXHuman);
	
	FXHumanSetName(human, name);
	FXHumanSetGender(human, gender);
	
	return human;
}

void __FXHumanDeallocate(FXHuman *human) {
	FXHumanSetName(human, NULL);
	FXHumanSetGender(human, kFXHumanGenderUndefined);
	FXHumanSetAge(human, 0);
	//
	
	__FXObjectDeallocate(human);
}

// marriage
void FXHumanMarriage(FXHuman *human, FXHuman *spouse) {
}

// divorce
void FXHumanDivorce(FXHuman *human) {
}

// children
FXHuman *FXHumanCreateChild(FXHuman *human) {
	return NULL;
}

int FXHumanGetChildrenCount(FXHuman *human) {
	return 0;
}

#pragma mark -
#pragma mark Private Accessors Implementation

void FXHumanSetName(FXHuman *human, char *name) {
	if (NULL != human) {
		strncpy(human->_name, name, sizeof(human->_name));
	}
}

char *FXHumanGetName(FXHuman *human) {
	if (NULL != human) {
		return human->_name;
	}
	return NULL;
}

void FXHumanSetAge(FXHuman *human, int age) {
	if (NULL != human) {
		human->_age = age;
	}
}

int FXHumanGetAge(FXHuman *human) {
	if (NULL != human) {
		return human->_age;
	}
	return 0;
}

void FXHumanSetGender(FXHuman *human, FXHumanGender gender) {
	if (NULL != human) {
		human->_gender = gender;
	}
}

FXHumanGender FXHumanGetGender(FXHuman *human) {
	if (NULL != human) {
		return human->_gender;
	}
	return 0;
}

// spouse
void FXHumanSetSpouse(FXHuman *human, FXHuman *spouse) {
	if (NULL != human && NULL != spouse && human != spouse) {
		human->_spouse = spouse;
	}
}

FXHuman *FXHumanGetSpouse(FXHuman *human) {
	if (NULL != human) {
		return human->_spouse;
	}
	return NULL;
}

// parents
void FXHumanSetMother(FXHuman *human, FXHuman *mother) {
	if (NULL != human && NULL != mother && human != mother) {
		human->_mother = mother;
	}
}

FXHuman *FXHumanGetMother(FXHuman *human) {
	if (NULL != human) {
		return human->_mother;
	}
	return NULL;
}

void FXHumanSetFather(FXHuman *human, FXHuman *father) {
	if (NULL != human && NULL != father && human != father) {
		human->_father = father;
	}
}

FXHuman *FXHumanGetFather(FXHuman *human) {
	if (NULL != human) {
		return human->_father;
	}
	return NULL;
}

