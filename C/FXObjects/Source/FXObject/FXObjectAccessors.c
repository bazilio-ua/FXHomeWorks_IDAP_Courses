//
//  FXObjectAccessors.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/5/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include "FXObject.h"

//extern
void FXAssignSetter(void *object, void **iVar, void *newVar);

//extern
void FXRetainSetter(void *object, void **iVar, void *newVar);

void FXAssignSetter(void *object, void **iVar, void *newVar) {
	if (NULL != object) {
		
		*iVar = newVar;
	}
}

void FXRetainSetter(void *object, void **iVar, void *newVar) {
	if (NULL != object && *iVar != newVar) {
		FXObjectRetain(newVar);
		FXObjectRelease(*iVar);
		
		*iVar = newVar;
	}
}