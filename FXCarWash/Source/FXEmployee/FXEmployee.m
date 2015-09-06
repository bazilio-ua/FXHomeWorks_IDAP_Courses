//
//  FXEmployee.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXEmployee.h"

#import "NSObject+FXExtensions.h"

@interface FXEmployee ()

@end

@implementation FXEmployee

@synthesize state			= _state;
@synthesize money			= _money;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	
	[super dealloc];
}

- (id)init {
	self = [super init];
	if (self) {
		self.money = 0;
		self.state = kFXEmployeeIsReady;
	}
	
	return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(FXEmployeeState)state {
	@synchronized(self) {
		if (state != _state) {
			_state = state;
			
			[self notifyObserversWithSelector:[self selectorForState:state] withObject:self];
		}
	}
}

#pragma mark -
#pragma mark Overloaded Methods

- (SEL)selectorForState:(FXEmployeeState)state {
	SEL selector = NULL;
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

#pragma mark -
#pragma mark Public Methods

// reloaded in subclasses
- (void)processObject:(id<FXMoneyFlow, FXEmployeeObserver>)object {
	
}

- (void)processJobWithObject:(id<FXMoneyFlow, FXEmployeeObserver>)object {
	if (nil != object) {
		self.state = kFXEmployeeStartedWork;
		
//		[self performSelectorInBackground:@selector(startJobWithObjectInBackground:) 
//							   withObject:object];
		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
			[self startJobWithObjectInBackground:object];
		});
	}
}

- (void)startJobWithObjectInBackground:(id<FXMoneyFlow, FXEmployeeObserver>)object {
	@autoreleasepool {
		@synchronized(object) {
			[self processObject:object];
		}
	}
	
//	[self performSelectorOnMainThread:@selector(finishJobWithObjectOnMainThread:) 
//						   withObject:object 
//						waitUntilDone:NO];
	dispatch_async(dispatch_get_main_queue(), ^{
		[self finishJobWithObjectOnMainThread:object];
	});
}

- (void)finishJobWithObjectOnMainThread:(id<FXMoneyFlow, FXEmployeeObserver>)object {
	FXEmployee *employee = object;
	if ([employee isKindOfClass:[FXEmployee class]]) {
		employee.state = kFXEmployeeIsReady;
	}
	
	self.state = kFXEmployeeFinishedWork;
}

#pragma mark -
#pragma mark FXMoneyFlow Protocol Methods

// required
- (BOOL)ableToPayMoney:(NSInteger)money {
	return self.money >= money;
}

// optional
- (void)receiveMoney:(NSInteger)money fromPayer:(id<FXMoneyFlow>)payer {
	if ([payer ableToPayMoney:money]) {
		payer.money -= money;
		self.money += money;
	}
}

- (void)sendMoney:(NSInteger)money toPayee:(id<FXMoneyFlow>)payee {
	if ([self ableToPayMoney:money]) {
		self.money -= money;
		payee.money += money;
	}
}

- (NSInteger)earningAmount {
	return self.money;
}

#pragma mark -
#pragma mark FXEmployeeObserver Protocol Methods

// optional
- (void)employeeIsReady:(FXEmployee *)employee {
	
}

- (void)employeeDidStartWork:(FXEmployee *)employee {
	
}

- (void)employeeDidFinishWork:(FXEmployee *)employee {
	
}

@end
