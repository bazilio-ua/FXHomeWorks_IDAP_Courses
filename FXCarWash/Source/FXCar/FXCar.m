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
	
	[super dealloc];
}

- (id)init {
	self = [super init];
	if (self) {
		self.money = 0;
		self.clean = NO;
	}
	
	return self;
}

#pragma mark -
#pragma mark FXMoneyFlow Protocol Methods

// required
- (BOOL)ableToPayMoney:(NSInteger)money {
	if (self.money >= money) {
		return YES;
	}
	
	NSLog(@"Car %@ unable to pay, not enough money", self);
	
	return NO;
}

@end
