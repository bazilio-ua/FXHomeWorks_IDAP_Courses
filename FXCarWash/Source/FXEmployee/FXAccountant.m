//
//  FXAccountant.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/19/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXAccountant.h"

@implementation FXAccountant

#pragma mark -
#pragma mark Public Methods

- (void)processObject:(id<FXMoneyFlow, FXEmployeeObserver>)object {
	NSInteger money = [object earningAmount];
	if (0 < money) {
		[self receiveMoney:money fromPayer:object];
		NSLog(@"Accountant: %@ got %ld money from Washer: %@ and calculate it (current earning %ld)", self, money, object, self.wallet);
	} else {
		NSLog(@"Accountant: %@ there is nothing to calculate", self);
	}
}

#pragma mark -
#pragma mark Overloaded Methods

//- (void)performEmployeeSpecificJobWithObject:(id<FXMoneyFlow, FXEmployeeObserver>)object {
//	if (nil != object) {
//		self.state = kFXEmployeeStartedWork;
//		
//		[self processObject:object];
//		
//		FXEmployee *employee = object;
//		employee.state = kFXEmployeeIsReady;
//		
//		self.state = kFXEmployeeFinishedWork;
//	}
//}

@end
