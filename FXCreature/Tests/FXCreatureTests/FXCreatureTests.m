//
//  FXCreatureTests.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/7/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXCreatureTests.h"
#import "FXCreature.h"
#import "FXCreatureMale.h"
#import "FXCreatureFemale.h"

@implementation FXCreatureTests

+ (void)doTest {
	NSLog(@"do FXCreature test");
	
	NSMutableArray *arrayOfCreatures = [[NSMutableArray array] autorelease];
	
//	FXCreature *charlieRoot = [[[FXCreature alloc] initWithName:@"Charlie Root" age:40 gender:kFXCreatureGenderMale] autorelease];
//	[arrayOfCreatures addObject:charlieRoot];
	
	FXCreatureMale *charlieRoot = [[[FXCreatureMale alloc] initWithName:@"Charlie Root" age:40] autorelease];
	[arrayOfCreatures addObject:charlieRoot];
	
//	FXCreature *johnDoe = [[[FXCreature alloc] initWithName:@"John Doe" age:25 gender:kFXCreatureGenderMale] autorelease];
//	FXCreature *janeDoe = [[[FXCreature alloc] initWithName:@"Jane Doe" age:24 gender:kFXCreatureGenderFemale] autorelease];
//	
//	[janeDoe addChild:[[[FXCreature alloc] initWithName:@"Johnnie Doe" age:5 gender:kFXCreatureGenderMale] autorelease]];
//	
//	[arrayOfCreatures addObject:johnDoe];
//	[arrayOfCreatures addObject:janeDoe];
	
	FXCreatureMale *johnDoe = [[[FXCreatureMale alloc] initWithName:@"John Doe" age:25] autorelease];
	FXCreatureFemale *janeDoe = [[[FXCreatureFemale alloc] initWithName:@"Jane Doe" age:24] autorelease];
	
	[janeDoe addChild:[[[FXCreatureMale alloc] initWithName:@"Johnnie Doe" age:5] autorelease]];
	
	[arrayOfCreatures addObject:johnDoe];
	[arrayOfCreatures addObject:janeDoe];
	
//	FXCreature *johnRoe = [[[FXCreature alloc] initWithName:@"John Roe" age:28 gender:kFXCreatureGenderMale] autorelease];
//	FXCreature *janeRoe = [[[FXCreature alloc] initWithName:@"Jane Roe" age:27 gender:kFXCreatureGenderFemale] autorelease];
//	
//	[johnRoe addChild:[[[FXCreature alloc] initWithName:@"Janie Doe" age:7 gender:kFXCreatureGenderFemale] autorelease]];
	
//	[arrayOfCreatures addObject:johnRoe];
//	[arrayOfCreatures addObject:janeRoe];
	
	FXCreatureMale *johnRoe = [[[FXCreatureMale alloc] initWithName:@"John Roe" age:28] autorelease];
	FXCreatureFemale *janeRoe = [[[FXCreatureFemale alloc] initWithName:@"Jane Roe" age:27] autorelease];
	
	[johnRoe addChild:[[[FXCreatureFemale alloc] initWithName:@"Janie Doe" age:7] autorelease]];
	
	[arrayOfCreatures addObject:johnRoe];
	[arrayOfCreatures addObject:janeRoe];
	
	for (FXCreature *creature in arrayOfCreatures) {
		NSLog(@"%@", [creature description]);
		
		[creature performGenderSpecificOperation];
//		[creature goToBattle];
//		[creature giveBirth];
		
		[creature sayHello];
	}
}

@end
