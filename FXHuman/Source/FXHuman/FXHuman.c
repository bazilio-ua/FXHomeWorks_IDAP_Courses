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
#include <stdbool.h>

#include "FXHuman.h"

#pragma mark -
#pragma mark Private Declaration

static const int kFXMaxNameLength = 64;
static const int kFXMaxChildrenCount = 20;

struct FXHuman {
	FXObject _super; // inheritance from FXObject
	
	char _name[kFXMaxNameLength];
	int _age;
	FXHumanGender _gender;
	
	FXHuman *_mother;
	FXHuman *_father;
	FXHuman *_spouse;
	
	int _childrenCount;
	FXHuman *_children[kFXMaxChildrenCount];
};

static
void FXHumanAddChild(FXHuman *human, FXHuman *child);

static
int FXHumanGetChildrenCount(FXHuman *human);

#pragma mark -
#pragma mark Public Methods Implementation

FXHuman *FXHumanCreateWithParameters(char *name, int age, FXHumanGender gender) {
	FXHuman *human = FXObjectCreateOfType(FXHuman);
	FXHumanSetName(human, name);
	FXHumanSetAge(human, age);
	FXHumanSetGender(human, gender);
	
	return human;
}

void __FXHumanDeallocate(FXHuman *human) {
	// FIXME this is not needed when dealloc?
//	FXHumanSetName(human, NULL);
//	FXHumanSetGender(human, 0);
//	FXHumanSetAge(human, 0);
	//
	
	__FXObjectDeallocate(human);
}

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
		if (FXHumanGetGender(human) != FXHumanGetGender(spouse)) {
			human->_spouse = spouse;
		}
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
		FXHumanAddChild(mother, human);
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
		FXHumanAddChild(father, human);
	}
}

FXHuman *FXHumanGetFather(FXHuman *human) {
	if (NULL != human) {
		return human->_father;
	}
	
	return NULL;
}

// marriage: FIXME return bool about success/fail?
void FXHumanMarriage(FXHuman *human, FXHuman *wed) {
	if (NULL != human && NULL != wed && human != wed) {
		FXHuman *spouse = FXHumanGetSpouse(human);
		if (wed != spouse) {
			if (NULL != spouse) {
				FXHumanDivorce(human);
			}
			FXHumanSetSpouse(human, wed);
			FXHumanSetSpouse(wed, human);
		}
	}	
}

// divorce
void FXHumanDivorce(FXHuman *human) {
	if (NULL != human) {
		FXHuman *spouse = FXHumanGetSpouse(human);
		if (NULL != spouse) {
			FXHumanSetSpouse(human, NULL);
			FXHumanSetSpouse(spouse, NULL);
		}
	}
}

// children
FXHuman *FXHumanCreateChildWithParameters(FXHuman *human, char *name, int age, FXHumanGender gender) {
	if (NULL != human) {
		FXHuman *spouse = FXHumanGetSpouse(human);
		if (NULL != spouse) {
			FXHuman *child = FXHumanCreateWithParameters(name, age, gender);
			FXHumanSetFather(child, human);
			FXHumanSetMother(child, spouse);
			// set and also added child into father's/mother's children array
			
			return child;
		}
	}
	
	return NULL;
}

#pragma mark -
#pragma mark Private Accessors Implementation

void FXHumanAddChild(FXHuman *human, FXHuman *child) {
	if (NULL != human && NULL != child && human != child) {
		if (FXHumanGetChildrenCount(human) < kFXMaxChildrenCount) {
			human->_children[human->_childrenCount] = child;
			human->_childrenCount++;
		}
	}
}

int FXHumanGetChildrenCount(FXHuman *human) { // this is really needed? TODO merge to FXHumanAddChild
	if (NULL != human) {
		return human->_childrenCount;
	}
	
	return 0;
}
