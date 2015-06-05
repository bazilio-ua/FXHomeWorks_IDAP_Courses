//
//  FXHuman.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <string.h>
//#include <stdbool.h>

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

// dealloc
void __FXHumanDeallocate(FXHuman *human) {
	FXHumanSetMother(human, NULL);
	FXHumanSetFather(human, NULL);
	FXHumanDivorce(human);
	FXHumanRemoveAllChildren(human);
	// do full zeroing allocated memory for our struct before free()
	FXHumanSetName(human, "");
	FXHumanSetAge(human, 0);
	FXHumanSetGender(human, 0);
	
	__FXObjectDeallocate(human);
}

FXHuman *FXHumanCreateWithParameters(char *name, int age, FXHumanGender gender) {
	FXHuman *human = FXObjectCreateOfType(FXHuman);
	FXHumanSetName(human, name);
	FXHumanSetAge(human, age);
	FXHumanSetGender(human, gender);
	
	return human;
}

// marriage
void FXHumanMarriage(FXHuman *human, FXHuman *wed) {
	if (NULL != human && NULL != wed && human != wed) {
		if (wed != FXHumanGetSpouse(human)) {
			FXHumanGender humanGender = FXHumanGetGender(human);
			FXHumanGender wedGender = FXHumanGetGender(wed);
			if (kFXHumanGenderUndefined != (humanGender && wedGender)) {
				if (humanGender != wedGender) {
					
					FXHumanDivorce(human);
					FXHumanDivorce(wed);
					
					FXHumanSetSpouse(human, wed);
					FXHumanSetSpouse(wed, human);
				}
			}
		}
	}
}

// divorce
void FXHumanDivorce(FXHuman *human) {
	FXHuman *spouse = FXHumanGetSpouse(human);
	if (NULL != spouse) {
		FXHumanSetSpouse(human, NULL);
		FXHumanSetSpouse(spouse, NULL);
	}
}

// children
FXHuman *FXHumanCreateChildWithParameters(FXHuman *human, char *name, int age, FXHumanGender gender) {
	if (NULL != human) {
		FXHuman *spouse = FXHumanGetSpouse(human);
		if (NULL != spouse) {
			FXHuman *child = FXHumanCreateWithParameters(name, age, gender);
			FXHumanAddChild(human, child);
			FXHumanAddChild(spouse, child);
			
			return child;
		}
	}
	
	return NULL;
}

void FXHumanSetChildAtIndex(FXHuman *human, FXHuman *child, unsigned int index) {
	if (NULL != human && index < kFXMaxChildrenCount) {
		FXStrongRetainSetter(human, _children[index], child);
		if (NULL != child) { // add case
			human->_childrenCount++;
		} else { // remove case if (NULL == child)
			human->_childrenCount--;
		}
	}
}

FXHuman *FXHumanGetChildAtIndex(FXHuman *human, unsigned int index) {
	if (NULL != human && index < kFXMaxChildrenCount) {
		return human->_children[index];
	}
	
	return NULL;	
}

void FXHumanAddChild(FXHuman *human, FXHuman *child) {
	if (NULL != human && NULL != child && human != child) {
		FXHumanGender humanGender = FXHumanGetGender(human);
		if (kFXHumanGenderUndefined != humanGender) {
			unsigned int childrenCount = FXHumanGetChildrenCount(human);
			if (childrenCount < kFXMaxChildrenCount) {
				FXHumanSetChildAtIndex(human, child, childrenCount);
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
		unsigned int count;
		for (count = 0; count < kFXMaxChildrenCount; count++) {
			if (human->_children[count] == child) {
				FXHumanSetChildAtIndex(human, NULL, count);
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

void FXHumanRemoveAllChildren(FXHuman *human) {
	if (NULL != human) {
		int count = kFXMaxChildrenCount;
		while (count--) {
			FXHuman *child = human->_children[count];
			if (NULL != child) {
				FXHumanRemoveChild(human, child);
			}
		}
	}
}

int FXHumanGetChildrenCount(FXHuman *human) {
	return (NULL != human) ? human->_childrenCount : 0;
}

// name
void FXHumanSetName(FXHuman *human, const char *name) {
	if (NULL != human) {
		size_t length = strlen(name);
		if (length < kFXMaxNameLength) {
			memmove(human->_name, name, length);
		} else {
			memmove(human->_name, name, kFXMaxNameLength - 1);
			human->_name[kFXMaxNameLength - 1] = '\0';
		}
	}
}

char *FXHumanGetName(FXHuman *human) {
	return (NULL != human) ? human->_name : NULL;
}

// age
void FXHumanSetAge(FXHuman *human, int age) {
	if (NULL != human) {
		human->_age = age;
	}
}

int FXHumanGetAge(FXHuman *human) {
	return (NULL != human) ? human->_age : 0;
}

// gender
void FXHumanSetGender(FXHuman *human, FXHumanGender gender) {
	if (NULL != human) {
		human->_gender = gender;
	}
}

FXHumanGender FXHumanGetGender(FXHuman *human) {
	return (NULL != human) ? human->_gender : 0;
}

// spouse
void FXHumanSetSpouse(FXHuman *human, FXHuman *spouse) {
	if (NULL != human && human != spouse) {
		if (kFXHumanGenderMale == FXHumanGetGender(human)) {
			FXStrongRetainSetter(human, _spouse, spouse);
		} else {
			FXWeakAssignSetter(human, _spouse, spouse);
		}
	}
}

FXHuman *FXHumanGetSpouse(FXHuman *human) {
	return (NULL != human) ? human->_spouse : NULL;
}

// parents
void FXHumanSetMother(FXHuman *human, FXHuman *mother) {
	if (human != mother) {
		FXWeakAssignSetter(human, _mother, mother);
	}
}

FXHuman *FXHumanGetMother(FXHuman *human) {
	return (NULL != human) ? human->_mother : NULL;
}

void FXHumanSetFather(FXHuman *human, FXHuman *father) {
	if (human != father) {
		FXWeakAssignSetter(human, _father, father);
	}
}

FXHuman *FXHumanGetFather(FXHuman *human) {
	return (NULL != human) ? human->_father : NULL;
}

#pragma mark -
#pragma mark Private Accessors Implementation

