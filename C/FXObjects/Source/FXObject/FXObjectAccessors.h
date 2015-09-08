//
//  FXObjectAccessors.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 6/5/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef FXHomeWorks_FXObjectAccessors_h
#define FXHomeWorks_FXObjectAccessors_h

extern
void FXAssignSetter(void *object, void **iVar, void *newVar);

extern
void FXRetainSetter(void *object, void **iVar, void *newVar);


#define FXAssignSetter(object, iVar, newVar) \
	FXAssignSetter(object, (void **)&(object->iVar), newVar)

#define FXRetainSetter(object, iVar, newVar) \
	FXRetainSetter(object, (void **)&(object->iVar), newVar)


#define FXPrimitiveSetter(object, iVar, newVar) { \
	if (NULL != object) { \
		object->iVar = newVar; \
	} \
}


#define FXPointerGetter(object, iVar) { \
	return (NULL != object) ? object->iVar : NULL; \
}

#define FXPrimitiveGetter(object, iVar) { \
	return (NULL != object) ? object->iVar : 0; \
}


#endif
