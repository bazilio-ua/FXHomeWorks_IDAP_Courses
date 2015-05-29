//
//  FXHumanTests.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/21/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

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
	void *shmi = FXHumanCreateWithParameters("Shmi Skywalker", 29, kFXHumanGenderFemale);
	
	void *anakin = FXHumanCreateWithParameters("Anakin Skywalker", 0, kFXHumanGenderMale);
	FXHumanSetMother(anakin, shmi);
	FXHumanSetAge(anakin, 20);
	
	void *padme = FXHumanCreateWithParameters("Padme Amidala", 25, kFXHumanGenderFemale);

//	FXHumanPrintInfo(shmi);
//	FXObjectRelease(shmi);
//	FXHumanPrintInfo(shmi);

	bool success = false;
	success = FXHumanMarriage(anakin, padme);
	printf("marriage is %s\n", success ? "successful" : "failed");
	
	void *luke = FXHumanCreateChildWithParameters(anakin, "Luke Skywalker", 0, kFXHumanGenderMale);
	void *leia = FXHumanCreateChildWithParameters(anakin, "Leia Organa", 0, kFXHumanGenderFemale);
	
	FXHumanSetAge(luke, 20);
	FXHumanSetAge(leia, 20);
	
//	FXHumanGetChildrenCount(padme);
//	FXHumanDeleteChildFromParent(padme, luke);
//	FXHumanGetChildrenCount(padme);
	
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
	printf("\thuman opject: %p\n", human);
	printf("\tname: %s\n", FXHumanGetName(human));
	int gender = FXHumanGetGender(human);
	printf("\tgender: %s\n",	(gender == kFXHumanGenderMale) ? "male" : 
								(gender == kFXHumanGenderFemale) ? "female" : 
												"undefined");
	printf("\tage: %d\n", FXHumanGetAge(human));
	printf("\tmother opject: %p\n", FXHumanGetMother(human));
	printf("\tfather opject: %p\n", FXHumanGetFather(human));
	printf("\tspouse opject: %p\n", FXHumanGetSpouse(human));
	
	printf("*** end of info ***\n\n");
}

