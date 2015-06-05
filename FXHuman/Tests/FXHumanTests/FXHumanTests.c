//
//  FXHumanTests.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/21/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <assert.h>

#include "FXTestsMacro.h"
#include "FXHumanTests.h"
#include "FXHuman.h"

#pragma mark -
#pragma mark Private Declaration

static
void FXHumanPrintInfo(FXHuman *human);

#pragma mark -
#pragma mark Public Implementation

void FXHumanBehaviourTests(void) {
	//	create Shmi
	void *shmi = FXHumanCreateWithParameters("Shmi Skywalker", 29, kFXHumanGenderFemale);
	//		pointer to Shmi should'n be NULL
	assert(NULL != shmi);
	//		reference count should be 1
	assert(1 == FXObjectGetReferenceCount(shmi));
	//		retain Shmi
	FXObjectRetain(shmi);
	//			after retaining Shmi reference count must be 2
	assert(2 == FXObjectGetReferenceCount(shmi));
	//		release Shmi
	FXObjectRelease(shmi);
	//			after release Shmi reference count should be 1
	assert(1 == FXObjectGetReferenceCount(shmi));
	
	//	create Anakin
	void *anakin = FXHumanCreateWithParameters("Anakin Skywalker", 0, kFXHumanGenderMale);
	//		after creation Anakin's age should be 0
	assert(0 == FXHumanGetAge(anakin));
	//		add Anakin as child to Shmi
	FXHumanAddChild(shmi, anakin);
	//		after adding Anakin as child his reference count must be 2
	assert(2 == FXObjectGetReferenceCount(anakin));
	//		set age to Anakin
	FXHumanSetAge(anakin, 20);
	//		age must be 20
	assert(20 == FXHumanGetAge(anakin));
	
	//	create Padme
	void *padme = FXHumanCreateWithParameters("Padme Amidala", 25, kFXHumanGenderFemale);
	//		gender of Padme should be a kFXHumanGenderFemale
	assert(kFXHumanGenderFemale == FXHumanGetGender(padme));
	//		reference count to Padme should be 1
	assert(1 == FXObjectGetReferenceCount(padme));
/*
	// release Shmi
	FXObjectRelease(shmi);
	// reference count of her child must be 1
	assert(1 == FXObjectGetReferenceCount(anakin));
*/	
//	FXHumanSetGender(anakin, kFXHumanGenderUndefined);
//	FXHumanSetGender(padme, kFXHumanGenderUndefined);
	//	do marriage with Anakin and Padme
	bool success = false;
	success = FXHumanMarriage(anakin, padme);
	printf("marriage is %s\n", success ? "successful" : "failed");
	//		after marriage reference count for Anakin should stay unchanged and be equal 2
	assert(2 == FXObjectGetReferenceCount(anakin));
	//		after marriage reference count for Padme should change and be equal 2
	assert(2 == FXObjectGetReferenceCount(padme));
	
	//	do divorce
//	if (true == FXHumanIsMarried(anakin)) {
		FXHumanDivorce(anakin);
//	}
	//		after divorce reference count for Anakin should stay unchanged and be equal 2
	assert(2 == FXObjectGetReferenceCount(anakin));
	//		after divorce reference count for Padme should be equal 1
	assert(1 == FXObjectGetReferenceCount(padme));

	//	do marriage again
	success = false;
	success = FXHumanMarriage(anakin, padme);
	printf("marriage is %s\n", success ? "successful" : "failed");
	//		after marriage reference count for Anakin should stay unchanged and be equal 2
	assert(2 == FXObjectGetReferenceCount(anakin));
	//		after marriage reference count for Padme should be equal 2
	assert(2 == FXObjectGetReferenceCount(padme));
	
	//	create children for Anakin and Padme
	void *luke = FXHumanCreateChildWithParameters(anakin, "Luke Skywalker", 0, kFXHumanGenderMale);
	FXHumanSetAge(luke, 20);
	void *leia = FXHumanCreateChildWithParameters(anakin, "Leia Organa", 0, kFXHumanGenderFemale);
	FXHumanSetAge(leia, 20);
	//		children's reference count must be equal 3
	assert(3 == FXObjectGetReferenceCount(luke));
	assert(3 == FXObjectGetReferenceCount(leia));
/*	
	//	do divorce
//	if (true == FXHumanIsMarried(padme)) {
		FXHumanDivorce(padme);
//	}
	//		after divorce reference count for Anakin should stay unchanged and be equal 1
	assert(1 == FXObjectGetReferenceCount(anakin));
	//		after divorce reference count for Padme should be equal 1
	assert(1 == FXObjectGetReferenceCount(padme));
	//		children's reference count must be equal 3
	assert(3 == FXObjectGetReferenceCount(luke));
	assert(3 == FXObjectGetReferenceCount(leia));
	
	//	release Padme
	FXObjectRelease(padme);
	// reference count for her children must be 2
	assert(2 == FXObjectGetReferenceCount(luke));
	assert(2 == FXObjectGetReferenceCount(leia));

	//	release Anakin
	FXObjectRelease(anakin);
	// reference count for his children must be 1
	assert(1 == FXObjectGetReferenceCount(luke));
	assert(1 == FXObjectGetReferenceCount(leia));
*/
	FXHumanPrintInfo(shmi);
	FXHumanPrintInfo(anakin);
	FXHumanPrintInfo(padme);
	FXHumanPrintInfo(luke);
	FXHumanPrintInfo(leia);
}

#pragma mark -
#pragma mark Private Implementation

void FXHumanPrintInfo(FXHuman *human) {
	if (human == NULL) {
		printf("no such human\n");
		
		return;
	}
	
	printf("\n*** Human debug info ***\n");
	printf("\thuman object: %p\n", human);
	printf("\tname: %s\n", FXHumanGetName(human));
	int gender = FXHumanGetGender(human);
	printf("\tgender: %s\n",	(gender == kFXHumanGenderMale) ?	"male" : 
								(gender == kFXHumanGenderFemale) ?	"female" : 
																	"undefined");
	printf("\tage: %d\n", FXHumanGetAge(human));
	printf("\tmother object: %p\n", FXHumanGetMother(human));
	printf("\tfather object: %p\n", FXHumanGetFather(human));
	printf("\tspouse object: %p\n", FXHumanGetSpouse(human));
	
	unsigned int count = FXHumanGetChildrenCount(human);
	printf("\tchildren count: %d\n", count);
	printf("\tchild object%s: ", (count > 1) ? "s" : "");
	while (count--) {
		printf("%p ", FXHumanGetChildAtIndex(human, count));
	}
	printf("\n");
	
	printf("*** end of info ***\n\n");
}
