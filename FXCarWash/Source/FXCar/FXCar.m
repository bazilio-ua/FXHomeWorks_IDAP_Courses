//
//  FXCar.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXCar.h"

@implementation FXCar
@synthesize money 	= _money;
@synthesize clean 	= _clean;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
	return [self initWithMoney:0];
}

- (id)initWithMoney:(float)money {
	self = [super init]; // init superclass
	
	if (self) {
		self.money = money;
		self.clean = NO;
	}
	
	return self;
}

#pragma mark -
#pragma mark Accessors

- (BOOL)doPayOff:(float)pay {
	float money = self.money;
	if ((money - pay) < 0) {
		NSLog(@"not enough cash to payoff");
		
		return NO;
	}
	
	self.money = money - pay;
	
	return YES;
}

@end
