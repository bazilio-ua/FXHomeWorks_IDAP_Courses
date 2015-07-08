//
//  FXCreatureTests.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/7/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXCreatureTests.h"
#import "FXCreature.h"

@implementation FXCreatureTests

+ (void)doTest {
	NSLog(@"do FXCreature test");
	
	FXCreature *creature = [[FXCreature alloc] initWithName:@"NameOne" age:25 gender:kFXCreatureGenderMale];
	
	[creature sayHello];
	
	[creature goToBattle];
	
	[creature giveBirth];
}

@end
