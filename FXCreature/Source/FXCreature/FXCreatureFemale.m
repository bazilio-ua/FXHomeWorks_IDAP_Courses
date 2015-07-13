//
//  FXCreatureFemale.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/12/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXCreatureFemale.h"
#import "FXCreatureMale.h"
#import "NSObject+FXExtensions.h"

@implementation FXCreatureFemale

- (id)performGenderSpecificOperation {
	NSLog(@"I gave birth");
	
	FXCreatureGender gender = (arc4random() % 2) + 1;
/*	
	if (kFXCreatureGenderMale == gender) {
		return [FXCreatureMale object];
	} else if (kFXCreatureGenderFemale == gender) {
		return [FXCreatureFemale object];
	}
*/	
	return (kFXCreatureGenderMale == gender) ? [FXCreatureMale object] : [FXCreatureFemale object];
}

@end
