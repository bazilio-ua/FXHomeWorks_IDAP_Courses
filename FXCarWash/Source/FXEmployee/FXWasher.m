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
		NSLog(@"Washer: %@ this Car: %@ is clean, but we should wash it anyway", self, car);
	}
}

#pragma mark -
#pragma mark Public Methods

- (void)performEmployeeSpecificJobForMoney:(NSInteger)money fromObject:(id<FXMoneyFlow>)object {
	if ([object ableToPayMoney:money]) {
		[self cleanCar:object];
		
		[super performEmployeeSpecificJobForMoney:money fromObject:object];
		NSLog(@"Washer: %@ earn %ld money from Car: %@", self, money, object);
	} else {
		NSLog(@"Washer: %@ didn't clean a Car: %@ because its doesn't have enough money", self, object);
	}
}

@end
