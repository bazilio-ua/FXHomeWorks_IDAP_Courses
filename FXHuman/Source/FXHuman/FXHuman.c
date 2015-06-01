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

// isMarried
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
		human->_children[index] = child;
		if (NULL != child) {
			human->_childrenCount++;
		} else {
			human->_childrenCount--;
		}
	}
}

void FXHumanAddChild(FXHuman *human, FXHuman *child) {
	if (NULL != human && NULL != child && human != child) {
		FXHumanGender humanGender = FXHumanGetGender(human);
		if (kFXHumanGenderUndefined != humanGender) {
			unsigned int childrenCount = FXHumanGetChildrenCount(human);
			if (/*FXHumanGetChildrenCount(human)*/childrenCount < kFXMaxChildrenCount) {
				
//				human->_children[human->_childrenCount] = child;
//				human->_childrenCount++;
				FXHumanSetChildAtIndex(human, child, /*FXHumanGetChildrenCount(human)*/childrenCount);
				
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
				
//				human->_children[count] = NULL;
//				human->_childrenCount--;
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

void FXHumanRemoveChildren(FXHuman *human) {
	if (NULL != human) {
		for (int count = 0; count < kFXMaxChildrenCount; count++) {
			FXHuman *child = human->_children[count];
			if (NULL != child) {
				FXHumanRemoveChild(human, child);
			}
		}
	}
}

int FXHumanGetChildrenCount(FXHuman *human) {
	if (NULL != human) {
		return human->_childrenCount;
	}
	
	return 0;
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
	}
}

FXHuman *FXHumanGetFather(FXHuman *human) {
	if (NULL != human) {
		return human->_father;
	}
	
	return NULL;
}

// dealloc
void __FXHumanDeallocate(FXHuman *human) {
	// clear parents
	FXHumanRemoveChild(FXHumanGetMother(human), human);
	FXHumanRemoveChild(FXHumanGetFather(human), human);
	
	// divorce with partner
	if (true == FXHumanIsMarried(human)) {
		FXHumanDivorce(human);
	}
	
	// clear children
	FXHumanRemoveChildren(human);
	
	// we clear it last, because we need gender for properly clear children
	FXHumanSetName(human, "");
	FXHumanSetAge(human, 0);
	FXHumanSetGender(human, 0);
	
	__FXObjectDeallocate(human);
}

#pragma mark -
#pragma mark Private Accessors Implementation

