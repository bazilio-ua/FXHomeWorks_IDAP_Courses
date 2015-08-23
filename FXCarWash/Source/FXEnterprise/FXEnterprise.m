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

#import "FXQueue.h"

#import "NSObject+FXExtensions.h"
#import "NSArray+FXExtensions.h"

const NSUInteger kFXCarWashPrice = 100;
static const NSUInteger kFXWashersNumber = 50;


@interface FXEnterprise ()
@property (nonatomic, retain)	NSMutableArray	*mutableEmployees;
@property (nonatomic, retain)	FXQueue			*mutableQueue;

- (void)processWorkFlow;

- (void)addEmployee:(id)employee;
- (void)removeEmployee:(id)employee;
- (id)readyEmployeeOfClass:(Class)class;
- (void)hireEmployees;

@end

@implementation FXEnterprise
@synthesize mutableEmployees	= _mutableEmployees;
@synthesize mutableQueue		= _mutableQueue;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	self.mutableEmployees = nil;
	self.mutableQueue = nil;
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
	self = [super init]; // init superclass
	
	if (self) {
		self.mutableEmployees = [NSMutableArray array];
		self.mutableQueue = [FXQueue object];
		
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
		[self.mutableQueue enqueueObject:object];
		[self processWorkFlow];
	}
}

#pragma mark -
#pragma mark Private Methods

- (void)processWorkFlow {
	FXWasher *washer = [self readyEmployeeOfClass:[FXWasher class]];
	if (nil != washer && kFXEmployeeIsReady == washer.state) {
		[washer performEmployeeSpecificJobWithObject:[self.mutableQueue dequeueObject]];
	} else {
		NSLog(@"All washers are busy right now");
	}
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
	
	for (NSUInteger count = 0; count < kFXWashersNumber; count++) {
		FXWasher *washer = [FXWasher object];
		[washer addObserver:accountant];
		[washer addObserver:self]; // enterprise is washer's observer
		[self addEmployee:washer];
	}
	
	// add observers
	[accountant addObserver:director];
//	[director addObserver:self]; // enterprise is director's observer (set it ready)
	
	[self addEmployee:director];
	[self addEmployee:accountant];
}

#pragma mark -
#pragma mark FXEmployeeObserver Protocol Methods

// optional
- (void)employeeIsReady:(FXEmployee *)employee {
	
	@synchronized (self) {
//		NSLog(@"%@ sel -> %@, notify: %@", employee, NSStringFromSelector(_cmd), self);
		if (YES == [employee isMemberOfClass:[FXWasher class]]) {
			[employee performEmployeeSpecificJobWithObject:[self.mutableQueue dequeueObject]];
		}
	}
}

- (void)employeeDidStartWork:(FXEmployee *)employee {
	
}

- (void)employeeDidFinishWork:(FXEmployee *)employee {
	
	@synchronized (self) {
//		NSLog(@"%@ sel -> %@, notify: %@", employee, NSStringFromSelector(_cmd), self);
//		if (YES == [employee isMemberOfClass:[FXDirector class]]) {
//			employee.state = kFXEmployeeIsReady;
//		}
	}
}

@end
