//
//  FXWasher.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/19/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXWasher.h"
#import "FXCar.h"

FOUNDATION_EXPORT const NSUInteger kFXCarWashPrice;

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

- (void)processObject:(id<FXMoneyFlow>)object {
	NSInteger money = kFXCarWashPrice;
	if ([object ableToPayMoney:money]) {
		[self cleanCar:object];
		[self receiveMoney:money fromPayer:object];
		NSLog(@"Washer: %@ earn %ld money from Car: %@", self, money, object);
	} else {
		NSLog(@"Washer: %@ didn't clean a Car: %@ because its doesn't have enough money", self, object);
	}
}

- (void)performEmployeeSpecificJobWithObject:(id<FXMoneyFlow, FXEmployeeObserver>)object {
	if (nil != object) {
		self.state = kFXEmployeeStartedWork;
		
		[self performSelectorInBackground:@selector(performEmployeeSpecificJobWithObjectInBackground:) 
							   withObject:object];
	}
}

@end
