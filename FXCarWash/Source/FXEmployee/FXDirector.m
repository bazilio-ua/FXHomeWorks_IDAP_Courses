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
		usleep(500 * (arc4random() % 10 + 1));
		[self receiveMoney:money fromPayer:object];
		NSLog(@"Director: %@ make a profit %ld money (%ld total) from Accountant: %@", self, money, self.wallet, object);
	} else {
		NSLog(@"Director: %@ there is no profit", self);
	}
}

@end
