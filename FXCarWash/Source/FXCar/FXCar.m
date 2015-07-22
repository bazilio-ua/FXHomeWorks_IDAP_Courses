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
@synthesize wallet	= _wallet;
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

- (id)initWithMoney:(NSInteger)money {
	self = [super init]; // init superclass
	
	if (self) {
		self.money = money;
		self.clean = NO;
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Methods

- (BOOL)doPayOff:(NSInteger)pay { // TODO: with protocol moneyFlow
	NSInteger money = self.money;
	if ((money - pay) < 0) {
		NSLog(@"not enough cash to payoff");
		
		return NO;
	}
	
	self.money = money - pay;
	
	return YES;
}

@end
