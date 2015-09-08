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
#import "FXDispatcher.h"

#import "NSObject+FXExtensions.h"

const NSUInteger kFXCarWashPrice = 100;
static const NSUInteger kFXWashersNumber = 50;
static const NSUInteger kFXAccountantsNumber = 10;
static const NSUInteger kFXDirectorsNumber = 1;


@interface FXEnterprise ()
@property (nonatomic, retain)	FXDispatcher	*washerDispatcher;
@property (nonatomic, retain)	FXDispatcher	*accountantDispatcher;
@property (nonatomic, retain)	FXDispatcher	*directorDispatcher;

- (void)hireEmployees;
- (void)fireEmployees;

@end

@implementation FXEnterprise

@synthesize washerDispatcher		= _washerDispatcher;
@synthesize accountantDispatcher	= _accountantDispatcher;
@synthesize directorDispatcher		= _directorDispatcher;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	self.washerDispatcher = nil;
	self.accountantDispatcher = nil;
	self.directorDispatcher = nil;
	
	[super dealloc];
}

- (id)init {
	self = [super init];
	if (self) {
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
//			[self.washerDispatcher processWorkFlowWithObject:object];
			dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
				[self.washerDispatcher processWorkFlowWithObject:object];
			});
		}
	}
}

#pragma mark -
#pragma mark Private Methods

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
}

- (void)fireEmployees {
	
}

#pragma mark -
#pragma mark FXEmployeeObserver Protocol Methods

// optional
- (void)employeeIsReady:(FXEmployee *)employee {
	
}

- (void)employeeDidStartWork:(FXEmployee *)employee {
	
}

- (void)employeeDidFinishWork:(FXEmployee *)employee {
	@synchronized(employee) {
		if (kFXEmployeeFinishedWork == employee.state) {
			if ([employee isMemberOfClass:[FXDirector class]]) {
				employee.state = kFXEmployeeIsReady;
			} else if ([employee isMemberOfClass:[FXAccountant class]]) {
//				[self.directorDispatcher processWorkFlowWithObject:employee];
				dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
					[self.directorDispatcher processWorkFlowWithObject:employee];
				});
			} else if ([employee isMemberOfClass:[FXWasher class]]) {
//				[self.accountantDispatcher processWorkFlowWithObject:employee];
				dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
					[self.accountantDispatcher processWorkFlowWithObject:employee];
				});
			}
		}
	}
}

@end
