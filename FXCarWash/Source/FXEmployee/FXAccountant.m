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
//- (void)performEmployeeSpecificJobForMoney:(NSInteger)money fromObject:(id<FXMoneyFlow>)object {
	NSInteger money = [object earningsAmount];
	if (0 < money) {
		
//		[super performEmployeeSpecificJobForMoney:money fromObject:object];
		[self receiveMoney:money fromPayer:object];
		NSLog(@"Accountant: %@ got %ld money from Washer: %@ and calculate it", self, money, object);
	} else {
		NSLog(@"Accountant: %@ there is nothing to calculate", self);
	}
}

@end
