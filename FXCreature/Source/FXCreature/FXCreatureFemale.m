//
//  FXCreatureFemale.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/12/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXCreatureFemale.h"
#import "FXCreature+FXExtensions.h"

@implementation FXCreatureFemale

- (FXCreature *)performGenderSpecificOperation {
	NSLog(@"I gave birth");
	
	return [FXCreature object];
}

@end
