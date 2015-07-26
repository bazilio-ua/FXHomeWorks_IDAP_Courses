//
//  FXWasher.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/19/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXWasher.h"
#import "FXCar.h"

@implementation FXWasher

#pragma mark -
#pragma mark Private Methods

- (void)cleanCar:(FXCar *)car {
	if (NO == car.isClean) {
		NSLog(@"Washer: %@ perform cleaning a Car: %@", self, car);
		car.clean = YES;
	} else {
		NSLog(@"Car %@ is clean but we should wash it anyway", car);
	}
}

#pragma mark -
#pragma mark Public Methods

- (void)performEmployeeSpecificJobForMoney:(NSInteger)money fromObject:(id<FXMoneyFlow>)object {
	self.busy = YES;

	[super performEmployeeSpecificJobForMoney:money fromObject:object];
	
	[self cleanCar:object];
	NSLog(@"Washer: %@ earn %ld money from Car: %@", self, money, object);
	
	self.busy = NO;
}

@end
