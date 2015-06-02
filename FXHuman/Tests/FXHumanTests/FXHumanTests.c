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
	FXHumanAddChild(shmi, anakin);
	FXHumanSetAge(anakin, 20);
	
	void *padme = FXHumanCreateWithParameters("Padme Amidala", 25, kFXHumanGenderFemale);

	bool success = false;
	success = FXHumanMarriage(anakin, padme);
	printf("marriage is %s\n", success ? "successful" : "failed");
	
	void *luke = FXHumanCreateChildWithParameters(anakin, "Luke Skywalker", 0, kFXHumanGenderMale);
	FXHumanSetAge(luke, 20);
	void *leia = FXHumanCreateChildWithParameters(anakin, "Leia Organa", 0, kFXHumanGenderFemale);
	FXHumanSetAge(leia, 20);
	
//	FXHumanDivorce(anakin);
	
	FXHumanPrintInfo(shmi);
	FXHumanPrintInfo(anakin);
	FXHumanPrintInfo(padme);
	FXHumanPrintInfo(luke);
	FXHumanPrintInfo(leia);

//	FXObjectRelease(shmi);
	
	FXHumanPrintInfo(shmi);
	FXHumanPrintInfo(anakin);
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
	printf("\tgender: %s\n",	(gender == kFXHumanGenderMale) ? "male" : 
								(gender == kFXHumanGenderFemale) ? "female" : 
												"undefined");
	printf("\tage: %d\n", FXHumanGetAge(human));
	printf("\tmother object: %p\n", FXHumanGetMother(human));
	printf("\tfather object: %p\n", FXHumanGetFather(human));
	printf("\tspouse object: %p\n", FXHumanGetSpouse(human));
	printf("\tchildren count: %d\n", FXHumanGetChildrenCount(human));
	
	printf("*** end of info ***\n\n");
}

