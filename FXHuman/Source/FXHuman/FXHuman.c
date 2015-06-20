//
//  FXHuman.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <stdint.h>

#include "FXHuman.h"

#pragma mark -
#pragma mark Private Declaration

//static const size_t kFXMaxNameLength = 64;
//static const uint64_t kFXMaxChildrenCount = 20;
static const uint32_t kFXHumanAdultAge = 18;

struct FXHuman {
	FXObject _super; // inheritance from FXObject
	
	FXString *_name;
//	char _name[kFXMaxNameLength];
	
	uint32_t _age;
	FXHumanGender _gender;
	
	FXHuman *_mother;
	FXHuman *_father;
	FXHuman *_spouse;
	
	FXArray *_children;
//	uint64_t _childrenCount;
//	FXHuman *_children[kFXMaxChildrenCount];
};

//<-- these should be a private
// children
static
void FXHumanSetChildren(FXHuman *human, FXArray *children); // for FXHuman create/dealloc

static
FXArray *FXHumanGetChildren(FXHuman *human);

static
void FXHumanRemoveChild(FXHuman *human, FXHuman *child);

//static
//void FXHumanRemoveAllChildren(FXHuman *human); // with FXArray this useless

//static
//void FXHumanSetChildAtIndex(FXHuman *human, FXHuman *child, uint64_t index); // with FXArray this useless

// gender
static
void FXHumanSetGender(FXHuman *human, FXHumanGender gender);

// spouse
static
void FXHumanSetSpouse(FXHuman *human, FXHuman *spouse);

// parents
static
void FXHumanSetMother(FXHuman *human, FXHuman *mother);

static
void FXHumanSetFather(FXHuman *human, FXHuman *father);
//--> these should be a private

#pragma mark -
#pragma mark Public Methods Implementation

// dealloc
void __FXHumanDeallocate(FXHuman *human) {
//	FXHumanSetMother(human, NULL); // this is not necessary
//	FXHumanSetFather(human, NULL); // this is not necessary
	FXHumanDivorce(human);
//	FXHumanRemoveAllChildren(human); // this should be gone from here, replaced by FXArray
	// do full zeroing allocated memory for our struct before free()
	FXHumanSetName(human, NULL);
//	FXHumanSetAge(human, 0); // this is not necessary
//	FXHumanSetGender(human, 0); // this is not necessary
	FXHumanSetChildren(human, NULL);
	
	__FXObjectDeallocate(human);
}

FXHuman *FXHumanCreateWithParameters(char *name, uint32_t age, FXHumanGender gender) {
	FXHuman *human = FXObjectCreateOfType(FXHuman);
	FXHumanSetName(human, name);
	FXHumanSetAge(human, age);
	FXHumanSetGender(human, gender);
	
	FXArray *children = FXArrayCreateWithCapacity(0);
	FXHumanSetChildren(human, children);
	FXObjectRelease(children);
	
	return human;
}

// marriage
void FXHumanMarriage(FXHuman *human, FXHuman *wed) {
	if (NULL != human && NULL != wed && human != wed) {
		if (wed != FXHumanGetSpouse(human)) {
			uint32_t humanAge = FXHumanGetAge(human);
			uint32_t wedAge = FXHumanGetAge(wed);
			if (kFXHumanAdultAge <= humanAge && kFXHumanAdultAge <= wedAge) {
				FXHumanGender humanGender = FXHumanGetGender(human);
				FXHumanGender wedGender = FXHumanGetGender(wed);
				if (kFXHumanGenderUndefined != humanGender && kFXHumanGenderUndefined != wedGender) {
					if (humanGender != wedGender) {
						// we need additionally retain weak wed partner before divorce, just in case
						FXHuman *weakWed = (kFXHumanGenderFemale == humanGender) ? human : wed;
						FXObjectRetain(weakWed);
						
						FXHumanDivorce(human);
						FXHumanDivorce(wed);
						
						FXObjectRelease(weakWed);
						
						FXHumanSetSpouse(human, wed);
						FXHumanSetSpouse(wed, human);
					}
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
FXHuman *FXHumanCreateChildWithParameters(FXHuman *human, char *name, uint32_t age, FXHumanGender gender) {
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

FXHuman *FXHumanGetChildAtIndex(FXHuman *human, uint64_t index) {
	if (NULL != human && index < FXHumanGetChildrenCount(human)) {
		
		return FXArrayGetObjectAtIndex(FXHumanGetChildren(human), index);
		
//		FXArray *children = FXHumanGetChildren(human);
//		
//		return FXArrayGetObjectAtIndex(children, index);
	}
	
	return NULL;
	
//	if (NULL != human && index < kFXMaxChildrenCount) {
//		return human->_children[index];
//	}
//	
//	return NULL;	
}

void FXHumanAddChild(FXHuman *human, FXHuman *child) {
	if (NULL != human && NULL != child && human != child) {
		FXHumanGender gender = FXHumanGetGender(human);
		if (kFXHumanGenderUndefined != gender) {

			FXArrayAddObject(FXHumanGetChildren(human), child);
			
//			FXArray *children = FXHumanGetChildren(human);
//			FXArrayAddObject(children, child);
			
//			uint64_t count = FXHumanGetChildrenCount(human);
//			if (count < kFXMaxChildrenCount) {
//				FXHumanSetChildAtIndex(human, child, count);
//				
				if (kFXHumanGenderMale == gender) {
					FXHumanSetFather(child, human);
				} else if (kFXHumanGenderFemale == gender) {
					FXHumanSetMother(child, human);
				}
//			}
			
		}
	}
}

uint64_t FXHumanGetChildrenCount(FXHuman *human) {
	if (NULL != human) {
		
		return FXArrayGetCount(FXHumanGetChildren(human));
		
//		FXArray *children = FXHumanGetChildren(human);
//		
//		return FXArrayGetCount(children);
	}
	
	return 0;
	
//	return (NULL != human) ? human->_childrenCount : 0;
}

// name
void FXHumanSetName(FXHuman *human, const char *name) {
	if (NULL != human) {
		
		FXString *previousName = human->_name;
		if (NULL != name) { // if we have some  data in 'name' to set
			
			if (NULL == previousName) { // if our object FXString _name dosn't exist (creation case)
				human->_name = FXStringCreateWithParameters(name); // create one with data 'name'
				
//				FXString *string = FXStringCreateWithParameters(name); // create one with data 'name'
//				human->_name = string;
			} else { // if we set another 'name' (change name case)
				FXStringSetData(human->_name, name);
			}
			
		} else { // if 'name' is equal to NULL (deallocation case)
			
			if (NULL != previousName) { // if our object FXString _name exist
				FXObjectRelease(human->_name); // just release it
				human->_name = NULL;
			}
			
		}
		
//		if (NULL != name) {
//			size_t length = strlen(name);
//			if (length < kFXMaxNameLength) {
//				memmove(human->_name, name, length);
//			} else {
//				memmove(human->_name, name, kFXMaxNameLength - 1);
//				human->_name[kFXMaxNameLength - 1] = '\0';
//			}
//		} else {
//			human->_name[0] = '\0';
//		}
	}
}

char *FXHumanGetName(FXHuman *human) {
	return (NULL != human) ? FXStringGetData(human->_name) : NULL;
//	return (NULL != human) ? human->_name : NULL;
}

// age
void FXHumanSetAge(FXHuman *human, uint32_t age) {
	FXPrimitiveSetter(human, _age, age);
//	if (NULL != human) {
//		human->_age = age;
//	}
}

uint32_t FXHumanGetAge(FXHuman *human) {
	FXPrimitiveGetter(human, _age);
//	return (NULL != human) ? human->_age : 0;
}

// gender
FXHumanGender FXHumanGetGender(FXHuman *human) {
	FXPrimitiveGetter(human, _gender);
//	return (NULL != human) ? human->_gender : 0;
}

// spouse
FXHuman *FXHumanGetSpouse(FXHuman *human) {
	FXPointerGetter(human, _spouse);
//	return (NULL != human) ? human->_spouse : NULL;
}

// parents
FXHuman *FXHumanGetMother(FXHuman *human) {
	FXPointerGetter(human, _mother);
//	return (NULL != human) ? human->_mother : NULL;
}

FXHuman *FXHumanGetFather(FXHuman *human) {
	FXPointerGetter(human, _father);
//	return (NULL != human) ? human->_father : NULL;
}

#pragma mark -
#pragma mark Private Accessors Implementation

// children
void FXHumanSetChildren(FXHuman *human, FXArray *children) {
	if (NULL != human) {
		
		FXArray *previousChildren = FXHumanGetChildren(human);
		if (NULL != children) { // if we wanna to set a new array
			
			if (NULL == previousChildren) { // if our array is not set (creation case)
				FXObjectRetain(children);
//				FXObjectRelease(human->_children); // this is not needed (don't need to release previous NULL value)
				human->_children = children;
			} else { // if we wanna to set another array (replace case)
				FXObjectRetain(children);
				FXObjectRelease(human->_children);
				human->_children = children;
			}
			
		} else { // if our new array is equal to NULL (deallocation case)
			
			if (NULL != previousChildren) { // if our previous array exist
				FXObjectRelease(human->_children);
				human->_children = NULL;
			}
			
		}
		
	}
}

FXArray *FXHumanGetChildren(FXHuman *human) {
	if (NULL != human) {
		return human->_children;
	}
	
	return NULL;
}

//void FXHumanSetChildAtIndex(FXHuman *human, FXHuman *child, uint64_t index) { // useless now
//	
//	
////	if (NULL != human && index < kFXMaxChildrenCount) {
////		FXRetainSetter(human, _children[index], child);
////		if (NULL != child) { // add case
////			human->_childrenCount++;
////		} else { // remove case if (NULL == child)
////			human->_childrenCount--;
////		}
////	}
//}

void FXHumanRemoveChild(FXHuman *human, FXHuman *child) {
	if (NULL != human && NULL != child && human != child) {
		
		FXArrayRemoveObject(FXHumanGetChildren(human), child);
		
//		FXArray *children = FXHumanGetChildren(human);
		
		// take index, check index and remove at index.. this long
//		uint64_t index = FXArrayGetIndexOfObject(children, child);
//		if (kFXIndexNotFound != index) {
//			FXArrayRemoveObjectAtIndex(children, index);
//		}
		// or just
//		FXArrayRemoveObject(children, child);
		
		
//		uint64_t count;
//		for (count = 0; count < kFXMaxChildrenCount; count++) {
//			if (human->_children[count] == child) {
//				FXHumanSetChildAtIndex(human, NULL, count);
//				break;
//			}
//		}
//		for (/*count*/; count < kFXMaxChildrenCount; count++) {
//			human->_children[count] = human->_children[count + 1];
//		}
		
		FXHumanGender gender = FXHumanGetGender(human);
		if (kFXHumanGenderMale == gender) {
			FXHumanSetFather(child, NULL);
		} else if (kFXHumanGenderFemale == gender) {
			FXHumanSetMother(child, NULL);
		}
	}
}

//void FXHumanRemoveAllChildren(FXHuman *human) { // useless now
//	if (NULL != human) {
//		
//		FXArray *children = FXHumanGetChildren(human);
//		
//		FXArrayRemoveAllObjects(children);
//		
////		uint64_t count = kFXMaxChildrenCount;
////		while (count--) {
////			FXHuman *child = human->_children[count];
////			if (NULL != child) {
////				FXHumanRemoveChild(human, child);
////			}
////		}
//		
//	}
//}

// gender
void FXHumanSetGender(FXHuman *human, FXHumanGender gender) {
	FXPrimitiveSetter(human, _gender, gender);
	//	if (NULL != human) {
	//		human->_gender = gender;
	//	}
}

// spouse
void FXHumanSetSpouse(FXHuman *human, FXHuman *spouse) {
	if (NULL != human && human != spouse) {
		if (kFXHumanGenderMale == FXHumanGetGender(human)) {
			FXRetainSetter(human, _spouse, spouse);
		} else {
			FXAssignSetter(human, _spouse, spouse);
		}
	}
}

// parents
void FXHumanSetMother(FXHuman *human, FXHuman *mother) {
	if (human != mother) {
		FXAssignSetter(human, _mother, mother);
	}
}

void FXHumanSetFather(FXHuman *human, FXHuman *father) {
	if (human != father) {
		FXAssignSetter(human, _father, father);
	}
}
