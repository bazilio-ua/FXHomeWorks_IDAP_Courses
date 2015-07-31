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

#import "NSObject+FXExtensions.h"

static const NSUInteger kFXRoomEmployeesCapacity = 2;
static const NSUInteger kFXWashBoxEmployeesCapacity = 1;
static const NSUInteger kFXWashBoxCarsCapacity = 1;
static const NSUInteger kFXCarWashPrice = 100;


@interface FXWorkFlow ()
@property (nonatomic, retain)	FXBuilding	*mutableWorkFlowBuilding;

- (void)setupWorkFlow;

@end

@implementation FXWorkFlow
@synthesize mutableWorkFlowBuilding 	= _mutableWorkFlowBuilding;

@dynamic workFlowBuilding;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	self.mutableWorkFlowBuilding = nil;
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
	self = [super init]; // init superclass
	
	if (self) {
		self.mutableWorkFlowBuilding = [FXBuilding object];
		[self setupWorkFlow];
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Accessors

- (FXBuilding *)workFlowBuilding {
	return [[self.mutableWorkFlowBuilding copy] autorelease];
}

#pragma mark -
#pragma mark Private Methods

- (void)setupWorkFlow {
	// create/setup building, rooms/boxes, employees and add it to workFlow
	
	// create building
	FXBuilding *building = [FXBuilding object];
	
	// create room and washbox
	FXRoom *room = [FXRoom object];
	FXWashBox *washbox = [FXWashBox object];
	
	// create employee
	FXDirector *director = [FXDirector object];
	FXAccountant *accountant = [FXAccountant object];
	FXWasher *washer = [FXWasher object];
	
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
	
	self.mutableWorkFlowBuilding = building;
}

#pragma mark -
#pragma mark Public Methods

- (void)performWorkFlowWithObject:(id)object {
	NSMutableArray *washers = [NSMutableArray array];
	NSMutableArray *accountants = [NSMutableArray array];
	NSMutableArray *directors = [NSMutableArray array];
	
	NSMutableArray *washboxes = [NSMutableArray array];
	
	// expand all ours action objects
	for (FXRoom *room in [self.mutableWorkFlowBuilding rooms]) {
		if ([room isMemberOfClass:[FXWashBox class]]) {
			[washboxes addObject:room];
			for (FXWasher *washer in [room employees]) {
				[washers addObject:washer];
			}
		} else {
			for (FXEmployee *employee in [room employees]) {
				if ([employee isMemberOfClass:[FXAccountant class]]) {
					[accountants addObject:employee];
				} else {
					[directors addObject:employee];
				}
			}
		}
	}
	
	// do all work with car
	id currentWashBox = nil;
	NSUInteger fullBoxCount = 0;
	for (FXWashBox *washbox in washboxes) {
		if (NO == washbox.isFull) {
			currentWashBox = washbox;
			[currentWashBox addCar:object];
			break;
		} else {
			fullBoxCount++;
		}
	}
	
	if (fullBoxCount == [washboxes count]) {
		NSLog(@"WorkFlow: %@ there is no free washboxes, try again later", self);
		
		return;
	}

	id currentObject = nil;
	for (FXWasher *washer in washers) {
		if (NO == washer.busy) {
			washer.busy = YES;
			[washer performEmployeeSpecificJobForMoney:kFXCarWashPrice fromObject:object];
			washer.busy = NO;
			currentObject = washer;
			break;
		}
	}
	
	for (FXAccountant *accountant in accountants) {
		if (NO == accountant.busy) {
			accountant.busy = YES;
			[accountant performEmployeeSpecificJobForMoney:[currentObject getEarningsAmount] fromObject:currentObject];
			accountant.busy = NO;
			currentObject = accountant;
			break;
		}
	}
	
	for (FXDirector *director in directors) {
		if (NO == director.busy) {
			director.busy = YES;
			[director performEmployeeSpecificJobForMoney:[currentObject getEarningsAmount] fromObject:currentObject];
			director.busy = NO;
			break;
		}
	}
	
	[currentWashBox removeCar:object];
}

@end
