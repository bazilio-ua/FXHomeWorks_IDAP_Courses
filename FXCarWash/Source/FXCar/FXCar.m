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
//@synthesize wallet		= _wallet; //temp

#pragma mark -
#pragma mark Class Methods

+ (id)car {
	return [[[self alloc] init] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
	self = [super init]; // init superclass
	
	if (self) {
		self.money = 0;
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

#pragma mark -
#pragma mark FXMoneyFlow Protocol

@end
