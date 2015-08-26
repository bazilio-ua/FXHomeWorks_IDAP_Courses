//
//  FXCarWashTests.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/26/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXCarWashTests.h"

#import "FXCar.h"
#import "FXEnterprise.h"

#import "NSObject+FXExtensions.h"

static const NSUInteger kFXCarsAmount = 1000;

@implementation FXCarWashTests

+ (void)performCarWashTest {
	NSLog(@"this is carwash workflow test...");
	
	FXEnterprise *workflow = [FXEnterprise object];
	
	for (NSUInteger count = 0; count < kFXCarsAmount; count++) {
		FXCar *car = [FXCar object];
		car.money = 100;
		car.clean = NO;
		[workflow performWorkWithObject:car];
	}
	
//	FXCar *car2 = [FXCar object];
//	car2.money = 100;
//	car2.clean = YES;
//	[workflow performWorkWithObject:car2];
//	
//	FXCar *car3 = [FXCar object];
//	car3.money = 50;
//	car3.clean = NO;
//	[workflow performWorkWithObject:car3];
	
	NSLog(@"end of carwash workflow test");
	
	[[NSRunLoop mainRunLoop] run];
}

@end
