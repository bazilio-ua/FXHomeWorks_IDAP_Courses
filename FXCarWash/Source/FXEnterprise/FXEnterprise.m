//
//  FXEnterprise.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXEnterprise.h"

#import "FXDirector.h"
#import "FXAccountant.h"
#import "FXWasher.h"

#import "NSObject+FXExtensions.h"

const NSUInteger kFXCarWashPrice = 100;


@interface FXEnterprise ()
@property (nonatomic, retain)	NSMutableArray	*mutableEmployees;
@property (nonatomic, retain)	NSMutableArray	*mutableCars;

- (void)processWorkFlow;

- (void)addCar:(id)car;
- (void)removeCar:(id)car;
- (id)carFromQueue;

- (void)addEmployee:(id)employee;
- (void)removeEmployee:(id)employee;
- (id)readyEmployeeOfClass:(Class)class;
- (void)hireEmployees;

@end

@implementation FXEnterprise
@synthesize mutableEmployees	= _mutableEmployees;
@synthesize mutableCars			= _mutableCars;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	self.mutableEmployees = nil;
	self.mutableCars = nil;
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
	self = [super init]; // init superclass
	
	if (self) {
		self.mutableEmployees = [NSMutableArray array];
		self.mutableCars = [NSMutableArray array];
		
		[self hireEmployees];
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Accessors


#pragma mark -
#pragma mark Public Methods

- (void)performWorkWithObject:(id)object {
	if (nil != object) {
		[self addCar:object];
		[self processWorkFlow];
	}
}

#pragma mark -
#pragma mark Private Methods

- (void)processWorkFlow {
	FXWasher *washer = [self readyEmployeeOfClass:[FXWasher class]];
	if (nil != washer) {
		[washer performEmployeeSpecificJobWithObject:[self carFromQueue]];
	} else {
		NSLog(@"Error: all washers are busy");
	}
}

// *cars*

- (void)addCar:(id)car {
	[self.mutableCars addObject:car];
	NSLog(@"The car %@ added to queue %@", car, self);
}

- (void)removeCar:(id)car {
	[self.mutableCars removeObject:car];
	NSLog(@"The car %@ removed from queue %@", car, self);
}

- (id)carFromQueue {
	id car = [[[self.mutableCars objectAtIndex:0] retain] autorelease]; // get first
	[self removeCar:car];
	
	return car;
}

// *employees*

- (void)addEmployee:(id)employee {
	[self.mutableEmployees addObject:employee];
}

- (void)removeEmployee:(id)employee {
	[self.mutableEmployees removeObject:employee];
}

- (id)readyEmployeeOfClass:(Class)class {
	NSArray *employees = self.mutableEmployees;
	for (FXEmployee *employee in employees) {
		if (YES == [employee isMemberOfClass:class]) {
			if (kFXEmployeeIsReady == employee.state) {
				return employee;
			}
		}
	}
	
	return nil;
}

- (void)hireEmployees {
	// create employee
	FXDirector *director = [FXDirector object];
	FXAccountant *accountant = [FXAccountant object];
	FXWasher *washer = [FXWasher object];
	
	// add observers
	[accountant addObserver:director];
	[washer addObserver:accountant];
	
	self.mutableEmployees = [NSMutableArray arrayWithObjects:director, accountant, washer, nil];
}

@end
