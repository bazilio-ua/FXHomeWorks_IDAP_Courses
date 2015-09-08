//
//  FXDispatcher.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/30/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXDispatcher.h"

#import "FXEmployeesPool.h"
#import "FXQueue.h"

#import "NSObject+FXExtensions.h"

@interface FXDispatcher ()
@property (nonatomic, retain)	FXEmployeesPool	*handlers;
@property (nonatomic, retain)	FXQueue			*queue;

@end

@implementation FXDispatcher

@synthesize handlers 	= _handlers;
@synthesize queue 		= _queue;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	self.handlers = nil;
	self.queue = nil;
	
	[super dealloc];
}

- (id)init {
	self = [super init];
	if (self) {
		self.handlers = [FXEmployeesPool object];
		self.queue = [FXQueue object];
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)addHandler:(FXEmployee *)handler {
	[handler addObserver:self];
	[self.handlers addEmployee:handler];
}

- (void)removeHandler:(FXEmployee *)handler {
	[handler removeObserver:self];
	[self.handlers removeEmployee:handler];
}

- (void)processWorkFlowWithObject:(id)object {
	FXEmployee *handler = [self.handlers reservedEmployee];
	if (nil != handler) {
		[handler processJobWithObject:object];
	} else {
//		NSLog(@"All employee handled by %@ are busy right now", self);
		[self.queue enqueueObject:object];
	}
}

#pragma mark -
#pragma mark FXEmployeeObserver Protocol Methods

// optional
- (void)employeeIsReady:(FXEmployee *)employee {
	if (kFXEmployeeIsReady == employee.state) {
		employee.state = kFXEmployeeStartedWork;
		[employee processJobWithObject:[self.queue dequeueObject]];
	}
}

- (void)employeeDidStartWork:(FXEmployee *)employee {
	
}

- (void)employeeDidFinishWork:(FXEmployee *)employee {
	
}

@end
