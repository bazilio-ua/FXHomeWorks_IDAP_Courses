//
//  FXCreature.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/7/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXCreature.h"

@implementation FXCreature

#pragma mark -
#pragma mark  Initializations and Deallocations

- (void)dealloc {
	self.name = nil;
	self.children = nil;
	
	[super dealloc];
}


- (instancetype)init {
	return self;
}

- (instancetype)initWithName:(NSString *)name age:(uint32_t)age gender:(FXCreatureGender)gender {
	return self;
}

- (void)addChild:(FXCreature *)child {
	
}
- (void)removeChild:(FXCreature *)child {
	
}

// merge this to one method 'doMainJob'
- (void)goToBattle {
	
}
- (FXCreature *)giveBirth {
	return self;
}

- (void)sayHello {
	
}


@end
