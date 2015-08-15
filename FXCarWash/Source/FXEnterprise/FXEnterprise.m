//
//  FXEnterprise.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXEnterprise.h"

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
const NSUInteger kFXCarWashPrice = 100;


@interface FXEnterprise ()
@property (nonatomic, retain)	NSMutableArray	*mutableBuildings;

- (void)generateEnterprise;

@end

@implementation FXEnterprise
@synthesize mutableBuildings 	= _mutableBuildings;

@dynamic buildings;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	self.mutableBuildings = nil;
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
	self = [super init]; // init superclass
	
	if (self) {
		self.mutableBuildings = [NSMutableArray array];
		[self generateEnterprise];
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Accessors

- (NSArray *)buildings {
	return [[self.mutableBuildings copy] autorelease];
}

#pragma mark -
#pragma mark Private Methods

- (void)generateEnterprise {
	// create/setup buildings, rooms/boxes, employees and add it to workflow
	
	// create buildings
	FXBuilding *adminBuilding = [FXBuilding object];
	FXBuilding *washBoxBuilding = [FXBuilding object];
	
	// create room and washbox
	FXRoom *room = [FXRoom object];
	FXWashBox *washbox = [FXWashBox object];
	
	// create employee
	FXDirector *director = [FXDirector object];
	FXAccountant *accountant = [FXAccountant object];
	FXWasher *washer = [FXWasher object];
	
	// add observers
	[accountant addObserver:director];
	[washer addObserver:accountant];
	
	// set rooms capacity
	room.employeeCapacity = kFXRoomEmployeesCapacity;
	washbox.employeeCapacity = kFXWashBoxEmployeesCapacity;
	washbox.carsCapacity = kFXWashBoxCarsCapacity;
	
	// add employee to rooms
	[room addEmployee:director];
	[room addEmployee:accountant];
	[washbox addEmployee:washer];
	
	// add rooms into the appropriate buildings
	[adminBuilding addRoom:room];
	[washBoxBuilding addRoom:washbox];
	
	self.mutableBuildings = [NSMutableArray arrayWithObjects:adminBuilding, washBoxBuilding, nil];
}

#pragma mark -
#pragma mark Public Methods

- (void)performWorkWithObject:(id)object {
	NSMutableArray *washers = [NSMutableArray array];
	NSMutableArray *accountants = [NSMutableArray array];
	NSMutableArray *directors = [NSMutableArray array];
	
	NSMutableArray *washboxes = [NSMutableArray array];
	
	// expand all ours action objects
	for (FXBuilding *building in self.mutableBuildings) {
		for (FXRoom *room in [building rooms]) {
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
		NSLog(@"Enterprise: %@ there is no free washboxes, try again later", self);
		
		return;
	}
	
	id currentObject = nil;
	for (FXWasher *washer in washers) {
		if (kFXEmployeeIsReady == washer.state) {
			[washer performEmployeeSpecificJobWithObject:object];
			currentObject = washer;
			break;
		}
	}
	
	for (FXAccountant *accountant in accountants) {
		if (kFXEmployeeIsReady == accountant.state) {
			[accountant performEmployeeSpecificJobWithObject:currentObject];
			currentObject = accountant;
			break;
		}
	}
	
	for (FXDirector *director in directors) {
		if (kFXEmployeeIsReady == director.state) {
			[director performEmployeeSpecificJobWithObject:currentObject];
			break;
		}
	}
	
	[currentWashBox removeCar:object];
}

@end
