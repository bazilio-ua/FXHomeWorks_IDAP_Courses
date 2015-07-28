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
	self = [super init]; // init superclass
	
	if (self) {
		self.money = 0;
		self.clean = NO;
	}
	
	return self;
}

#pragma mark -
#pragma mark FXMoneyFlow Protocol required Methods

- (BOOL)ableToPayMoney:(NSInteger)money {
	if (self.money >= money) {
		return YES;
	}
	
	NSLog(@"Car %@ unable to pay, not enough money", self);
	
	return NO;
	
//	return self.money >= money ? YES : NO;
}

- (void)receiveMoney:(NSInteger)money fromPayer:(id<FXMoneyFlow>)payer {
	if ([payer respondsToSelector:@selector(sendMoney:toPayee:)] && [payer ableToPayMoney:money]) {
		self.money += money;
		[payer sendMoney:money toPayee:self];
	}
}

- (void)sendMoney:(NSInteger)money toPayee:(id<FXMoneyFlow>)payee {
	if ([payee respondsToSelector:@selector(receiveMoney:fromPayer:)] && [self ableToPayMoney:money]) {
		self.money -= money;
	}
}

@end
