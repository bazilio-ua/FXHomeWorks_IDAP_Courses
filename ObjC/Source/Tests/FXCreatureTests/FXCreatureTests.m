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
	
	FXCreature *charlie = [[[FXCreature alloc] initWithName:@"Charlie Root" age:25 gender:kFXCreatureGenderMale] autorelease];
	[charlie sayHello];
	[charlie goToBattle];
	[charlie giveBirth];
	
	NSMutableArray *arrayOfCreatures = [NSMutableArray arrayWithCapacity:13];
	
	for (uint32_t iterator = 0; iterator < 13; iterator++) {
		FXCreatureGender gender = ((iterator % 2) == 0) ? kFXCreatureGenderMale : kFXCreatureGenderFemale;
		
		NSString *name = [NSString stringWithFormat:@"%s Doe #%u", 
						  gender == kFXCreatureGenderMale ? "John" : "Jane", 
						  iterator + 1];
		
		FXCreature *creature = [[[FXCreature alloc] initWithName:name 
															 age:((iterator + 1) * 10) 
														  gender:gender] autorelease];
		
		[creature addChild:[[[FXCreature alloc] initWithName:[name stringByAppendingString:@"s child Doe"] 
														 age:(iterator + 1) 
													  gender:gender] autorelease]];
		
		[arrayOfCreatures addObject:creature];
	}
	
	for (FXCreature *creature in arrayOfCreatures) {
		[creature sayHello];
		[creature goToBattle];
		[creature giveBirth];
	}
}

@end
