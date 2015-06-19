//
//  FXHumanTests.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/21/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <string.h>
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
	
	//		pointer to Shmi should not be NULL
	assert(NULL != shmi);
	
	//	create Anakin
	void *anakin = FXHumanCreateWithParameters("Anakin Skywalker", 0, kFXHumanGenderMale);
	
	//	check returning name is identical to created name
	assert(0 == strcmp("Anakin Skywalker", FXHumanGetName(anakin)));
	
	//		add Anakin as child to Shmi
	FXHumanAddChild(shmi, anakin);
	
	//		after adding Anakin as child
	//			pointer to Anakin's mother should be equal Shmi
	assert(shmi == FXHumanGetMother(anakin));
	
	//			pointer to Anakin's father should be NULL, because we don't know who is his father
	assert(NULL == FXHumanGetFather(anakin));
	
	//			pointer at index[0] of Shmi children array should be equal Anakin
	assert(anakin == FXHumanGetChildAtIndex(shmi, 0));
	
	//			reference count must be 2
	assert(2 == FXObjectGetReferenceCount(anakin));
	
	//		set age to Anakin
	FXHumanSetAge(anakin, 20);
	
	//		age must be 20
	assert(20 == FXHumanGetAge(anakin));
	
	
	//	create Padme
	void *padme = FXHumanCreateWithParameters("Padme Amidala", 25, kFXHumanGenderFemale);
	
	//		reference count for Padme should be equal 1
	assert(1 == FXObjectGetReferenceCount(padme));
	
	
	//	do marriage with Anakin and Padme
	FXHumanMarriage(padme, anakin);
	
	//		after marriage
	//			Anakin's pointer to spouse should be equal Padme
	assert(padme == FXHumanGetSpouse(anakin));
	
	//			and vise versa
	assert(anakin == FXHumanGetSpouse(padme));
	
	//			reference count for Anakin should stay unchanged and be equal 2
	assert(2 == FXObjectGetReferenceCount(anakin));
	
	//			reference count for Padme should change and be equal 2
	assert(2 == FXObjectGetReferenceCount(padme));
	
	
	//	do divorce with Anakin and his wife Padme
	FXHumanDivorce(anakin);
	
	//		after divorce
	//			Anakin's pointer to spouse should be equal NULL
	assert(NULL == FXHumanGetSpouse(anakin));
	
	//			and vise versa for his ex-partner
	assert(NULL == FXHumanGetSpouse(padme));
	
	//			reference count for Anakin should stay unchanged and be equal 2
	assert(2 == FXObjectGetReferenceCount(anakin));
	
	//			reference count for Padme should be equal 1
	assert(1 == FXObjectGetReferenceCount(padme));
	
	
	//	do marriage again
	FXHumanMarriage(anakin, padme);
	
	//		after marriage
	//			Anakin's pointer to spouse should be equal Padme
	assert(padme == FXHumanGetSpouse(anakin));
	
	//			and vise versa
	assert(anakin == FXHumanGetSpouse(padme));
	
	//			reference count for Anakin should stay unchanged and be equal 2
	assert(2 == FXObjectGetReferenceCount(anakin));
	
	//			reference count for Padme should change and be equal 2
	assert(2 == FXObjectGetReferenceCount(padme));
	
	
	//	create children for Anakin and Padme
	void *luke = FXHumanCreateChildWithParameters(anakin, "Luke Skywalker", 20, kFXHumanGenderMale);
	void *leia = FXHumanCreateChildWithParameters(padme, "Leia Organa", 20, kFXHumanGenderFemale);
	
	FXHuman *childs[2] = {luke, leia};
	for (uint8_t count = 0; count < 2; count++) {
		//		after create children
		//			pointer to Luke/Leia mother should be equal Padme
		assert(padme == FXHumanGetMother(childs[count]));
		
		//			pointer to Luke/Leia father should be equal Anakin, because (Luke! I'm your father!)
		assert(anakin == FXHumanGetFather(childs[count]));
		
		//			pointer at index[0] of Padme children array should be equal Luke
		//			pointer at index[1] of Padme children array should be equal Leia
		assert(childs[count] == FXHumanGetChildAtIndex(padme, count));
		
		//			pointer at index[0] of Anakin children array should be equal Luke
		//			pointer at index[1] of Anakin children array should be equal Leia
		assert(childs[count] == FXHumanGetChildAtIndex(anakin, count));
		
		//			children's reference count must be equal 3
		assert(3 == FXObjectGetReferenceCount(childs[count]));
	}
	
	// print debug info
	FXHumanPrintInfo(shmi);
	FXHumanPrintInfo(anakin);
	FXHumanPrintInfo(padme);
	FXHumanPrintInfo(luke);
	FXHumanPrintInfo(leia);
	
	// release them
	FXObjectRelease(shmi);
	FXObjectRelease(anakin);
	FXObjectRelease(padme);
	FXObjectRelease(luke);
	FXObjectRelease(leia);
	
//	void *unknown = FXHumanCreateWithParameters("Unknown", 0, kFXHumanGenderUndefined);
//	FXHumanPrintInfo(unknown);
//	FXHumanSetName(unknown, NULL);
//	FXHumanPrintInfo(unknown);
//	FXHumanSetName(unknown, "Unknown human");
//	FXHumanPrintInfo(unknown);
//	FXObjectRelease(unknown);
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
	
	uint64_t count = FXHumanGetChildrenCount(human);
	printf("\tchildren count: %llu\n", count);
	printf("\tchild object%s: ", (count > 1) ? "s" : "");
	while (count--) {
		printf("%p ", FXHumanGetChildAtIndex(human, count));
	}
	printf("\n");
	
	printf("*** end of info ***\n\n");
}
