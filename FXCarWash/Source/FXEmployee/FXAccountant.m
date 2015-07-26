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

- (void)performEmployeeSpecificJobForMoney:(NSInteger)money fromObject:(id<FXMoneyFlow>)object {
	self.busy = YES;

	[super performEmployeeSpecificJobForMoney:money fromObject:object];
	
	NSLog(@"Accountant: %@ got %ld money from Washer: %@ and calculate it", self, money, object);
	
	self.busy = NO;
}

@end
