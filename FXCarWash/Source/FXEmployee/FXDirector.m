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

//- (void)performEmployeeSpecificJobWithObject:(id<FXMoneyFlow>)object {
- (void)performEmployeeSpecificJobForMoney:(NSInteger)money fromObject:(id<FXMoneyFlow>)object {
	if (0 < [object earningsAmount]) {
		
//		[super performEmployeeSpecificJobForMoney:money fromObject:object];
		[self receiveMoney:money fromPayer:object];
		NSLog(@"Director: %@ make a profit %ld money (%ld total) from Accountant: %@", self, money, self.wallet, object);
	} else {
		NSLog(@"Director: %@ there is no profit", self);
	}
}

@end
