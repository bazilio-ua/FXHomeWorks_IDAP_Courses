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

- (void)performEmployeeSpecificJobWithObject:(id<FXMoneyFlow>)object {
	NSInteger money = [object earningsAmount];
	if (0 < money) {
		self.state = kFXEmployeeStartedWork; // start work ->
		[self receiveMoney:money fromPayer:object];
		NSLog(@"Director: %@ make a profit %ld money (%ld total) from Accountant: %@", self, money, self.wallet, object);
		self.state = kFXEmployeeFinishedWork; // finish work.
		
		FXEmployee *employee = (FXEmployee *)object;
		employee.state = kFXEmployeeIsReady; // release accountant
		
		self.state = kFXEmployeeIsReady; // release self
	} else {
		NSLog(@"Director: %@ there is no profit", self);
	}
}

@end
