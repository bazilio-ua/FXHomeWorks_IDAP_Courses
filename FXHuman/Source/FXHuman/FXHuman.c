//
//  FXHuman.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <assert.h>

#include "FXHuman.h"

FXHuman *FXHumanCreate(char *name, FXHumanGender gender) {
	FXHuman *human = FXObjectCreateOfType(FXHuman);
	assert(NULL != human); // sanity
	
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

void FXHumanRelease(FXHuman *human) {
}

void FXHumanSetName(FXHuman *human, char *name) {
	if (NULL != human) {
		human->_name = name;
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
	return kFXHumanGenderUndefined;
}

void FXHumanSetIsAlive(FXHuman *human, bool alive) {
	if (NULL != human) {
		human->_isAlive = alive;
	}
}

bool FXHumanGetIsAlive(FXHuman *human) {
	if (NULL != human) {
		return human->_isAlive;
	}
	return false;
}

void FXHumanSetMaritalStatus(FXHuman *human, FXHumanMaritalStatus status) {
	if (NULL != human) {
		human->_maritalStatus = status;
	}
}

FXHumanMaritalStatus FXHumanGetMaritalStatus(FXHuman *human) {
	if (NULL != human) {
		return human->_maritalStatus;
	}
	return kFXumanStatusUndefined;
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

// children
FXHuman *FXHumanCreateChild(FXHuman *human, FXHuman *spouse) {
	return NULL;
}

int FXHumanGetChildrenCount(FXHuman *human) {
	return 0;
}

// friends
FXHuman *FXHumanAddFriend(FXHuman *human, FXHuman *newFriend) {
	return NULL;
}

int FXHumanGetFriendsCount(FXHuman *human) {
	return 0;
}
