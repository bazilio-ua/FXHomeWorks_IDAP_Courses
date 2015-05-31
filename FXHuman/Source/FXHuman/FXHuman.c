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
	unsigned int _age;
	FXHumanGender _gender;
	
	FXHuman *_mother;
	FXHuman *_father;
	FXHuman *_spouse;
	
	unsigned int _childrenCount;
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
	FXHumanSetName(human, "");
	FXHumanSetAge(human, 0);
	FXHumanSetGender(human, 0);
/*	
	// remove self in parent's children array
	FXHumanDeleteChildFromParent(FXHumanGetMother(human), human);
	FXHumanDeleteChildFromParent(FXHumanGetFather(human), human);
	// remove pointers to parent
	FXHumanSetMother(human, NULL);
	FXHumanSetFather(human, NULL);
*/	
	FXHumanRemoveChild(FXHumanGetMother(human), human);
	FXHumanRemoveChild(FXHumanGetFather(human), human);
/*	
	// remove self in partner spouse pointer 
	FXHumanDeletePartnerFromSpouse(human);
	// remove pointer to spouse
	FXHumanSetSpouse(human, NULL);
*/
	if (true == FXHumanIsMarried(human)) {
		FXHumanDivorce(human);
	}
/*	
	// remove self as parent in your children array
	FXHumanDeleteParentFromChild(human);
	// remove all pointers to children
	FXHumanDeleteChildren(human);
*/
	FXHumanRemoveChildren(human);
	
	__FXObjectDeallocate(human);
}

/*
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
*/


// marriage
bool FXHumanMarriage(FXHuman *human, FXHuman *wed) {
	bool result = false;
	if (NULL != human && NULL != wed && human != wed) {
		if (wed != FXHumanGetSpouse(human)) {
			FXHumanGender humanGender = FXHumanGetGender(human);
			FXHumanGender wedGender = FXHumanGetGender(wed);
			if (kFXHumanGenderUndefined != humanGender && 
				kFXHumanGenderUndefined != wedGender) {
				if (humanGender != wedGender) {
					if (true == FXHumanIsMarried(human)) {
						FXHumanDivorce(human);
					}
					
					if (true == FXHumanIsMarried(wed)) {
						FXHumanDivorce(wed);
					}
					
					FXHumanSetSpouse(human, wed);
					FXHumanSetSpouse(wed, human);
					result = true;
				}
			}
		}
	}
	
	return result;
}

// ***
bool FXHumanIsMarried(FXHuman *human) {
	if (NULL != FXHumanGetSpouse(human)) {
		return true;
	}
	
	return false;
}

// divorce
void FXHumanDivorce(FXHuman *human) {
	FXHuman *spouse = FXHumanGetSpouse(human);
	if (NULL != spouse) {
		FXHumanSetSpouse(human, NULL);
		FXHumanSetSpouse(spouse, NULL);
	}
}


// name
void FXHumanSetName(FXHuman *human, char *name) {
	if (NULL != human) {
		memmove(human->_name, name, sizeof(human->_name) - 1);
		human->_name[sizeof(human->_name) - 1] = '\0';
	}
}

char *FXHumanGetName(FXHuman *human) {
	if (NULL != human) {
		return human->_name;
	}
	
	return NULL;
}

// age
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

// gender
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
	if (NULL != human && human != spouse) {
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
	if (NULL != human && human != mother) {
		human->_mother = mother;
//		FXHumanAddChild(mother, human);
	}
}

FXHuman *FXHumanGetMother(FXHuman *human) {
	if (NULL != human) {
		return human->_mother;
	}
	
	return NULL;
}

void FXHumanSetFather(FXHuman *human, FXHuman *father) {
	if (NULL != human && human != father) {
		human->_father = father;
//		FXHumanAddChild(father, human);
	}
}

FXHuman *FXHumanGetFather(FXHuman *human) {
	if (NULL != human) {
		return human->_father;
	}
	
	return NULL;
}


// children
FXHuman *FXHumanCreateChildWithParameters(FXHuman *human, char *name, int age, FXHumanGender gender) {
	if (NULL != human) {
		FXHuman *spouse = FXHumanGetSpouse(human);
		if (NULL != spouse) {
			FXHuman *child = FXHumanCreateWithParameters(name, age, gender);
			
			// set and add child into parents children array
//			FXHumanSetFather(child, human);
//			FXHumanSetMother(child, spouse);

			FXHumanAddChild(human, child);
			FXHumanAddChild(spouse, child);

			return child;
		}
	}
	
	return NULL;
}

void FXHumanAddChild(FXHuman *human, FXHuman *child) {
	if (NULL != human && NULL != child && human != child) {
		FXHumanGender humanGender = FXHumanGetGender(human);
		if (kFXHumanGenderUndefined != humanGender) {
			if (FXHumanGetChildrenCount(human) < kFXMaxChildrenCount) {
				human->_children[human->_childrenCount] = child;
				human->_childrenCount++;
				if (kFXHumanGenderMale == humanGender) {
					FXHumanSetFather(child, human);
				} else if (kFXHumanGenderFemale == humanGender) {
					FXHumanSetMother(child, human);
				}
			}
		}
	}
}

void FXHumanRemoveChild(FXHuman *human, FXHuman *child) {
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
		
		FXHumanGender humanGender = FXHumanGetGender(human);
		if (kFXHumanGenderMale == humanGender) {
			FXHumanSetFather(child, NULL);
		} else if (kFXHumanGenderFemale == humanGender) {
			FXHumanSetMother(child, NULL);
		}
	}
}

//void FXHumanDeleteChildFromParent(FXHuman *human, FXHuman *child) { // for dealloc
//	if (NULL != human && NULL != child && human != child) {
//		int count;
//		for (count = 0; count < kFXMaxChildrenCount; count++) {
//			if (human->_children[count] == child) {
//				human->_children[count] = NULL;
//				human->_childrenCount--;
//				break;
//			}
//		}
//		
//		for (/*count*/; count < kFXMaxChildrenCount; count++) {
//			human->_children[count] = human->_children[count + 1];
//		}
//	}
//}


void FXHumanRemoveChildren(FXHuman *human) {
	if (NULL != human) {
		for (int count = 0; count < kFXMaxChildrenCount; count++) {
			FXHuman *child = human->_children[count];
			if (NULL != child) {
				FXHumanRemoveChild(human, child);
			}
			human->_children[count] = NULL;
		}
		human->_childrenCount = 0;
	}
}

/*
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
*/
/*
void FXHumanDeleteChildren(FXHuman *human) { // for dealloc
	if (NULL != human) {
		for (int count = 0; count < kFXMaxChildrenCount; count++) {
			human->_children[count] = NULL;
		}
		human->_childrenCount = 0;
	}
}
*/

int FXHumanGetChildrenCount(FXHuman *human) {
	if (NULL != human) {
		return human->_childrenCount;
	}
	
	return 0;
}

#pragma mark -
#pragma mark Private Accessors Implementation

