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
//#import "FXEmployeesPool.h"
#import "FXDispatcher.h"

//#import "FXQueue.h"

#import "NSObject+FXExtensions.h"

const NSUInteger kFXCarWashPrice = 100;
static const NSUInteger kFXWashersNumber = 50;
static const NSUInteger kFXAccountantsNumber = 10;
static const NSUInteger kFXDirectorsNumber = 1;


@interface FXEnterprise ()
//@property (nonatomic, retain)	FXEmployeesPool	*employees;
//@property (nonatomic, retain)	FXQueue			*queue;

@property (nonatomic, retain)	FXDispatcher	*washerDispatcher;
@property (nonatomic, retain)	FXDispatcher	*accountantDispatcher;
@property (nonatomic, retain)	FXDispatcher	*directorDispatcher;

//- (void)processWorkFlowWithObject:(id)object;

- (void)hireEmployees;
- (void)fireEmployees;

@end

@implementation FXEnterprise

//@synthesize employees				= _employees;
//@synthesize queue					= _queue;

@synthesize washerDispatcher		= _washerDispatcher;
@synthesize accountantDispatcher	= _accountantDispatcher;
@synthesize directorDispatcher		= _directorDispatcher;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
//	self.employees = nil;
//	self.queue = nil;
	
	self.washerDispatcher = nil;
	self.accountantDispatcher = nil;
	self.directorDispatcher = nil;
	
	[super dealloc];
}

- (id)init {
	self = [super init];
	if (self) {
//		self.employees = [FXEmployeesPool object];
//		self.queue = [FXQueue object];
		
		self.washerDispatcher = [FXDispatcher object];
		self.accountantDispatcher = [FXDispatcher object];
		self.directorDispatcher = [FXDispatcher object];
		
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
			[self.washerDispatcher processWorkFlowWithObject:object];
		}
	}
}

#pragma mark -
#pragma mark Private Methods

//- (void)processWorkFlowWithObject:(id)object {
//	FXWasher *washer = [self.employees readyEmployeeOfClass:[FXWasher class]];
//	@synchronized(washer) {
//		if (nil != washer && kFXEmployeeIsReady == washer.state) {
//			[washer processJobWithObject:object];
//		} else {
//			NSLog(@"All washers are busy right now");
//			[self.queue enqueueObject:object];
//		}
//	}
//}

- (void)hireEmployees {
	// create employee, add them to dispatcher and observe it
	for (NSUInteger count = 0; count < kFXWashersNumber; count++) {
		FXWasher *washer = [FXWasher object];
		[washer addObserver:self];
		[self.washerDispatcher addHandler:washer];
	}
	
	for (NSUInteger count = 0; count < kFXAccountantsNumber; count++) {
		FXAccountant *accountant = [FXAccountant object];
		[accountant addObserver:self];
		[self.accountantDispatcher addHandler:accountant];
	}
	
	for (NSUInteger count = 0; count < kFXDirectorsNumber; count++) {
		FXDirector *director = [FXDirector object];
		[director addObserver:self];
		[self.directorDispatcher addHandler:director];
	}
	
//	// create employee
//	FXDirector *director = [FXDirector object];
//	FXAccountant *accountant = [FXAccountant object];
//	
//	for (NSUInteger count = 0; count < kFXWashersNumber; count++) {
//		FXWasher *washer = [FXWasher object];
//		[washer addObserver:accountant];
//		[washer addObserver:self]; // enterprise is washer's observer
//		[self.employees addEmployee:washer];
//	}
//	
//	// add observers
//	[accountant addObserver:director];
//	[director addObserver:self]; // enterprise is director's observer (set it ready)
//	
//	[self.employees addEmployee:director];
//	[self.employees addEmployee:accountant];
}

- (void)fireEmployees {
	
}

#pragma mark -
#pragma mark FXEmployeeObserver Protocol Methods

// optional
- (void)employeeIsReady:(FXEmployee *)employee {
//	if (YES == [employee isMemberOfClass:[FXWasher class]]) {
//		[employee processJobWithObject:[self.queue dequeueObject]];
//	}
}

- (void)employeeDidStartWork:(FXEmployee *)employee {
	
}

- (void)employeeDidFinishWork:(FXEmployee *)employee {
	@synchronized(employee) {
		if (kFXEmployeeFinishedWork == employee.state) {
			if (YES == [employee isMemberOfClass:[FXDirector class]]) {
				employee.state = kFXEmployeeIsReady;
			} else if (YES == [employee isMemberOfClass:[FXAccountant class]]) {
				[self.directorDispatcher processWorkFlowWithObject:employee];
			} else if (YES == [employee isMemberOfClass:[FXWasher class]]) {
				[self.accountantDispatcher processWorkFlowWithObject:employee];
			}
		}
	}
}

@end
