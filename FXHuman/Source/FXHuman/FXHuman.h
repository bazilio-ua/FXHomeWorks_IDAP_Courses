//
//  FXHuman.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef FXHomeWorks_FXHuman_h
#define FXHomeWorks_FXHuman_h

#include <stdbool.h>

#include "FXObject.h"

typedef enum {
	kFXGenderUndefined,
	kFXGenderMale,
	kFXGenderFemale
} FXGender;

typedef struct FXHuman FXHuman;

struct FXHuman {
	FXObject _super; // inheritance from FXObject
	
	FXGender _gender;
	char *_name;
	int _age;
	bool _isAlive;
	bool _isMarried;
	
	FXHuman *_mother;
	FXHuman *_father;
	FXHuman *_spouse;
	FXHuman **_friends;
	FXHuman **_children;
};

#endif
