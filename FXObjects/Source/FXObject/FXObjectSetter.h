//
//  FXObjectSetter.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/5/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef FXHomeWorks_FXObjectSetter_h
#define FXHomeWorks_FXObjectSetter_h
/*
extern
void FXTestAssignSetter(void *object, void **iVar, void *newVar);

extern
void FXTestRetainSetter(void *object, void **iVar, void *newVar);
*/
extern
void FXAssignSetter(void *object, void **iVar, void *newVar);

#define FXWeakAssignSetter(object, iVar, newVar) \
	FXAssignSetter(object, (void **)&(object->iVar), newVar)

extern
void FXRetainSetter(void *object, void **iVar, void *newVar);

#define FXStrongRetainSetter(object, iVar, newVar) \
	FXRetainSetter(object, (void **)&(object->iVar), newVar)

#endif
