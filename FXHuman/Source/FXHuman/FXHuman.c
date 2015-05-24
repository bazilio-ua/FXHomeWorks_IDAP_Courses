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
	
	// remove self in parent's children array
	FXHumanDeleteChildFromParent(FXHumanGetMother(human), human);
	FXHumanDeleteChildFromParent(FXHumanGetFather(human), human);
	// remove pointers to parent
	FXHumanSetMother(human, NULL);
	FXHumanSetFather(human, NULL);
	
	// remove self in partner spouse pointer 
	FXHumanDeletePartnerFromSpouse(human);
	// remove pointer to spouse
	FXHumanSetSpouse(human, NULL);
	
	// remove self as parent in your children array
	FXHumanDeleteParentFromChild(human);
	// remove all pointers to children
	FXHumanDeleteChildren(human);
	
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

void FXHumanDeletePartnerFromSpouse(FXHuman *human) { // for dealloc
	if (NULL != human) { 
		FXHuman *partner = FXHumanGetSpouse(human);
		if (NULL != partner) {
			if (FXHumanGetSpouse(partner) == human) {
				FXHumanSetSpouse(partner, NULL);
			}
		}
	}
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

// marriage: TODO return bool about success/fail?
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
			// set and add child into parents children array
			FXHumanSetFather(child, human);
			FXHumanSetMother(child, spouse);
			
			return child;
		}
	}
	
	return NULL;
}

void FXHumanAddChild(FXHuman *human, FXHuman *child) {
	if (NULL != human && NULL != child && human != child) {
		if (FXHumanGetChildrenCount(human) < kFXMaxChildrenCount) {
			human->_children[human->_childrenCount] = child;
			human->_childrenCount++;
		}
	}
}

void FXHumanDeleteChildFromParent(FXHuman *human, FXHuman *child) { // for dealloc
	if (NULL != human && NULL != child && human != child) {
		int count;
		for (count = 0; count < kFXMaxChildrenCount; count++) {
			if (human->_children[count] == child) {
				human->_children[count] = NULL;
				human->_childrenCount--;
				break;
			}
		}
		
		for (/*count*/; count < kFXMaxChildrenCount; count++) {
			human->_children[count] = human->_children[count + 1];
		}
	}
}

void FXHumanDeleteParentFromChild(FXHuman *human) { // for dealloc
	if (NULL != human) {
		for (int count = 0; count < kFXMaxChildrenCount; count++) {
			FXHuman *child = human->_children[count];
			if (NULL != child) {
				FXHuman *father = FXHumanGetFather(child);
				FXHuman *mother = FXHumanGetMother(child);
				if (human == father) {
					FXHumanSetFather(child, NULL);
				}
				
				if (human == mother) {
					FXHumanSetMother(child, NULL);
				}
			}
		}
	}
}

void FXHumanDeleteChildren(FXHuman *human) { // for dealloc
	if (NULL != human) {
		for (int count = 0; count < kFXMaxChildrenCount; count++) {
			human->_children[count] = NULL;
		}
		human->_childrenCount = 0;
	}
}

int FXHumanGetChildrenCount(FXHuman *human) {
	if (NULL != human) {
		return human->_childrenCount;
	}
	
	return 0;
}

#pragma mark -
#pragma mark Private Accessors Implementation

