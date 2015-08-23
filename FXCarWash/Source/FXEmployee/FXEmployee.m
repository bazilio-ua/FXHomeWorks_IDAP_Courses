//
//  FXEmployee.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXEmployee.h"

#import "FXQueue.h"

#import "NSArray+FXExtensions.h"
#import "NSObject+FXExtensions.h"

@interface FXEmployee ()
@property (nonatomic, retain)	FXQueue			*mutableQueue;

@end

@implementation FXEmployee
@synthesize state			= _state;
@synthesize wallet			= _wallet;
@synthesize mutableQueue		= _mutableQueue;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	self.mutableQueue = nil;
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
	self = [super init]; // init superclass
	
	if (self) {
		self.wallet = 0;
		self.state = kFXEmployeeIsReady;
		self.mutableQueue = [FXQueue object];
	}
	
	return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(FXEmployeeState)state {
	if (state != _state) {
		_state = state;
		
		[self notifyObserversWithSelector:[self selectorForState:state] withObject:self];
	}
}

#pragma mark -
#pragma mark Overloaded Methods

- (SEL)selectorForState:(FXEmployeeState)state {
	SEL selector;
	switch (state) {
		case kFXEmployeeIsReady:
			selector = @selector(employeeIsReady:);
			break;
			
		case kFXEmployeeStartedWork:
			selector = @selector(employeeDidStartWork:);
			break;
			
		case kFXEmployeeFinishedWork:
			selector = @selector(employeeDidFinishWork:);
			break;
	}
	
	return selector;
}

- (void)processObject:(id<FXMoneyFlow, FXEmployeeObserver>)object {
	
}

#pragma mark -
#pragma mark Public Methods

- (void)performEmployeeSpecificJobWithObject:(id<FXMoneyFlow, FXEmployeeObserver>)object {
	if (nil != object) {
		self.state = kFXEmployeeStartedWork;
		
		[self performSelectorInBackground:@selector(performEmployeeSpecificJobWithObjectInBackground:) 
							   withObject:object];
	}
}

- (void)performEmployeeSpecificJobWithObjectInBackground:(id<FXMoneyFlow, FXEmployeeObserver>)object {
	[self processObject:object];
	
	[self performSelectorOnMainThread:@selector(finishEmployeeSpecificJobWithObjectOnMainThread:) 
							   withObject:object 
							waitUntilDone:NO];
}

- (void)finishEmployeeSpecificJobWithObjectOnMainThread:(id<FXMoneyFlow, FXEmployeeObserver>)object {
	FXEmployee *employee = object;
	if (YES == [employee isKindOfClass:[FXEmployee class]]) {
		employee.state = kFXEmployeeIsReady;
	}
	
	self.state = kFXEmployeeFinishedWork;
}

#pragma mark -
#pragma mark FXMoneyFlow Protocol Methods

// optional
- (NSInteger)earningsAmount {
	@synchronized(self) {
		return self.wallet;
	}
}

// required
- (BOOL)ableToPayMoney:(NSInteger)money {
	@synchronized(self) {
		return self.wallet >= money;
	}
}

- (void)receiveMoney:(NSInteger)money fromPayer:(id<FXMoneyFlow>)payer {
	if ([payer respondsToSelector:@selector(sendMoney:toPayee:)] && [payer ableToPayMoney:money]) {
		self.wallet += money;
		[payer sendMoney:money toPayee:self];
	}
}

- (void)sendMoney:(NSInteger)money toPayee:(id<FXMoneyFlow>)payee {
	if ([payee respondsToSelector:@selector(receiveMoney:fromPayer:)] && [self ableToPayMoney:money]) {
		self.wallet -= money;
	}
}

#pragma mark -
#pragma mark FXEmployeeObserver Protocol Methods

// optional
- (void)employeeIsReady:(FXEmployee *)employee {
	@synchronized (self) {
//		NSLog(@"%@ sel -> %@, notify: %@", employee, NSStringFromSelector(_cmd), self);
	}
}

- (void)employeeDidStartWork:(FXEmployee *)employee {
	
}

- (void)employeeDidFinishWork:(FXEmployee *)employee {
	@synchronized (self) {
//		NSLog(@"%@ sel -> %@, notify: %@", employee, NSStringFromSelector(_cmd), self);
		[self performEmployeeSpecificJobWithObject:employee];
	}
}

@end
