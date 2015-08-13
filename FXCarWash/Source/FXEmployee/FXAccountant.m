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

- (void)performEmployeeSpecificJobWithObject:(id<FXMoneyFlow>)object {
	NSInteger money = [object earningsAmount];
	if (0 < money) {
		self.state = kFXEmployeeStartedWork; // start work ->
		[self receiveMoney:money fromPayer:object];
		NSLog(@"Accountant: %@ got %ld money from Washer: %@ and calculate it", self, money, object);
		self.state = kFXEmployeeFinishedWork; // finish work. (ready to transfer money)
		
		FXEmployee *employee = (FXEmployee *)object;
		employee.state = kFXEmployeeIsReady; // release washer
	} else {
		NSLog(@"Accountant: %@ there is nothing to calculate", self);
	}
}

@end
