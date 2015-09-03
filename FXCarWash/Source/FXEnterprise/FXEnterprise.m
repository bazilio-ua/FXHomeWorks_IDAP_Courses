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
#import "FXEmployeesPool.h"

#import "FXQueue.h"

#import "NSObject+FXExtensions.h"
#import "NSArray+FXExtensions.h"

const NSUInteger kFXCarWashPrice = 100;
static const NSUInteger kFXWashersNumber = 50;


@interface FXEnterprise ()
@property (nonatomic, retain)	FXEmployeesPool	*employees;
@property (nonatomic, retain)	FXQueue			*queue;

- (void)processWorkFlowWithObject:(id)object;

- (void)hireEmployees;
- (void)fireEmployees;

@end

@implementation FXEnterprise

@synthesize employees			= _employees;
@synthesize queue				= _queue;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	self.employees = nil;
	self.queue = nil;
	
	[super dealloc];
}

- (id)init {
	self = [super init];
	if (self) {
		self.employees = [FXEmployeesPool object];
		self.queue = [FXQueue object];
		
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
		@autoreleasepool {
			[self processWorkFlowWithObject:object];
		}
	}
}

#pragma mark -
#pragma mark Private Methods

- (void)processWorkFlowWithObject:(id)object {
	FXWasher *washer = [self.employees readyEmployeeOfClass:[FXWasher class]];
	@synchronized(washer) {
		if (nil != washer && kFXEmployeeIsReady == washer.state) {
			[washer processJobWithObject:object];
		} else {
			NSLog(@"All washers are busy right now");
			[self.queue enqueueObject:object];
		}
	}
}


- (void)hireEmployees {
	// create employee
	FXDirector *director = [FXDirector object];
	FXAccountant *accountant = [FXAccountant object];
	
	for (NSUInteger count = 0; count < kFXWashersNumber; count++) {
		FXWasher *washer = [FXWasher object];
		[washer addObserver:accountant];
		[washer addObserver:self]; // enterprise is washer's observer
		[self.employees addEmployee:washer];
	}
	
	// add observers
	[accountant addObserver:director];
	[director addObserver:self]; // enterprise is director's observer (set it ready)
	
	[self.employees addEmployee:director];
	[self.employees addEmployee:accountant];
}

- (void)fireEmployees {
	
}

#pragma mark -
#pragma mark FXEmployeeObserver Protocol Methods

// optional
- (void)employeeIsReady:(FXEmployee *)employee {
//	NSLog(@"notification from: %@ to: %@ with selector: %@", employee, self, NSStringFromSelector(_cmd));
	if (YES == [employee isMemberOfClass:[FXWasher class]]) {
		[employee processJobWithObject:[self.queue dequeueObject]];
	}
}

- (void)employeeDidStartWork:(FXEmployee *)employee {
//	NSLog(@"notification from: %@ to: %@ with selector: %@", employee, self, NSStringFromSelector(_cmd));
}

- (void)employeeDidFinishWork:(FXEmployee *)employee {
//	NSLog(@"notification from: %@ to: %@ with selector: %@", employee, self, NSStringFromSelector(_cmd));
	if (YES == [employee isMemberOfClass:[FXDirector class]]) {
		employee.state = kFXEmployeeIsReady;
	}
}

@end
