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

@implementation FXCarWashTests

+ (void)performCarWashTest {
	NSLog(@"this is carwash test");
	
	FXWorkFlow *workflow = [FXWorkFlow workflow];
	
	FXCar *car1 = [FXCar car];
	FXCar *car2 = [FXCar car];
	FXCar *car3 = [FXCar car];
	
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
