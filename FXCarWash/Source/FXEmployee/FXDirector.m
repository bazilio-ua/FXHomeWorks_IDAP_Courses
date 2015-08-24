//
//  FXDirector.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/19/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXDirector.h"

@implementation FXDirector

#pragma mark -
#pragma mark Public Methods

- (void)processObject:(id<FXMoneyFlow, FXEmployeeObserver>)object {
	NSInteger money = [object earningAmount];
	if (0 < money) {
		[self receiveMoney:money fromPayer:object];
		NSLog(@"Director: %@ make a profit %ld money (%ld total) from Accountant: %@", self, money, self.wallet, object);
	} else {
		NSLog(@"Director: %@ there is no profit", self);
	}
}

#pragma mark -
#pragma mark Overloaded Methods

- (void)performEmployeeSpecificJobWithObject:(id<FXMoneyFlow, FXEmployeeObserver>)object {
	if (nil != object) {
		self.state = kFXEmployeeStartedWork;
		
		[self processObject:object];
		
		FXEmployee *employee = object;
		employee.state = kFXEmployeeIsReady;
		
		self.state = kFXEmployeeFinishedWork;
		
		self.state = kFXEmployeeIsReady; // director is set self state to ready (finish workflow chain)
	}
}

//- (void)finishEmployeeSpecificJobWithObjectOnMainThread:(id<FXMoneyFlow, FXEmployeeObserver>)object {
//	[super finishEmployeeSpecificJobWithObjectOnMainThread:object];
//	
//	self.state = kFXEmployeeIsReady;
//}

@end
