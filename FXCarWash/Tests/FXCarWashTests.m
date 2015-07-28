//
//  FXCarWashTests.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/26/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXCarWashTests.h"

#import "FXCar.h"
#import "FXWorkFlow.h"

#import "NSObject+FXExtensions.h"

@implementation FXCarWashTests

+ (void)performCarWashTest {
	NSLog(@"this is carwash workflow test");
	
	FXWorkFlow *workflow = [FXWorkFlow object];
	
	FXCar *car1 = [FXCar object];
	FXCar *car2 = [FXCar object];
	FXCar *car3 = [FXCar object];
	
	car1.money = 300;
	car1.clean = NO;
	
	car2.money = 250;
	car2.clean = YES;
	
	car3.money = 50;
	car3.clean = NO;
	
	[workflow performWorkFlowWithObject:car1];
	[workflow performWorkFlowWithObject:car2];
	[workflow performWorkFlowWithObject:car3];
}

@end
