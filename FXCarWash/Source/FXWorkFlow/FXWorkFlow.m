//
//  FXWorkFlow.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXWorkFlow.h"

#import "FXBuilding.h"
#import "FXRoom.h"
#import "FXWashBox.h"
#import "FXDirector.h"
#import "FXAccountant.h"
#import "FXWasher.h"

static const NSUInteger kFXRoomEmployeesCapacity = 3;
static const NSUInteger kFXWashBoxEmployeesCapacity = 1;
static const NSUInteger kFXWashBoxCarsCapacity = 1;

@implementation FXWorkFlow

#pragma mark -
#pragma mark Private Methods

- (void)setupWorkFlow {
	// setup building, rooms/boxes, employees and add car
	
	// create building
	FXBuilding *building = [FXBuilding building];
	
	// create room and box
	FXRoom *room = [FXRoom room];
	FXWashBox *washbox = [FXWashBox room];
	
	// create employee
	FXDirector *director = [FXDirector employee];
	FXAccountant *accountant = [FXAccountant employee];
	FXWasher *washer = [FXWasher employee];
	
	// set rooms capacity
	room.employeeCapacity = kFXRoomEmployeesCapacity;
	washbox.employeeCapacity = kFXWashBoxEmployeesCapacity;
	washbox.carsCapacity = kFXWashBoxCarsCapacity;
	
	// add employee to rooms
	[room addEmployee:director];
	[room addEmployee:accountant];
	[washbox addEmployee:washer];
	
	// add rooms to the building
	[building addRoom:room];
	[building addRoom:washbox];
}

#pragma mark -
#pragma mark Public Methods

- (void)performWorkFlow {
	// do all work with car
}

@end
