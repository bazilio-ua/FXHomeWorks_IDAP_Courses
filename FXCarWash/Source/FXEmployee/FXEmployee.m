//
//  FXEmployee.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXEmployee.h"

#import "NSArray+FXExtensions.h"

@interface FXEmployee ()
@property (nonatomic, retain)	NSMutableArray	*mutableObjects;

- (void)enqueueObject:(id)object;
- (id)dequeueObject;

@end

@implementation FXEmployee
@synthesize state			= _state;
@synthesize wallet			= _wallet;
@synthesize mutableObjects	= _mutableObjects;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	self.mutableObjects = nil;
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
	self = [super init]; // init superclass
	
	if (self) {
		self.wallet = 0;
		self.state = kFXEmployeeIsReady;
		self.mutableObjects = [NSMutableArray array];
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
			
		default:
			[self doesNotRecognizeSelector:_cmd]; // raise exception
			break;
	}
	
	return selector;
}

- (void)processObject:(id<FXMoneyFlow, FXEmployeeObserver>)object {
	[self doesNotRecognizeSelector:_cmd];
}

#pragma mark -
#pragma mark Public Methods

- (void)performEmployeeSpecificJobWithObject:(id<FXMoneyFlow, FXEmployeeObserver>)object {
	if (nil != object) {
//		self.state = kFXEmployeeStartedWork;
//		[self processObject:object];
//		self.state = kFXEmployeeFinishedWork;
		
		self.state = kFXEmployeeStartedWork;
//		[self performEmployeeSpecificJobWithObjectInBackground:object];
		[self performSelectorInBackground:@selector(performEmployeeSpecificJobWithObjectInBackground:) 
							   withObject:object];

	}
}

- (void)performEmployeeSpecificJobWithObjectInBackground:(id<FXMoneyFlow, FXEmployeeObserver>)object {
	[self processObject:object];

//	if (YES == [NSThread isMainThread]) {
//		[self finishEmployeeSpecificJobWithObjectOnMainThread:object];
//	} else {
		[self performSelectorOnMainThread:@selector(finishEmployeeSpecificJobWithObjectOnMainThread:) 
							   withObject:object 
							waitUntilDone:NO];
//	}
}

- (void)finishEmployeeSpecificJobWithObjectOnMainThread:(id<FXMoneyFlow, FXEmployeeObserver>)object {
	self.state = kFXEmployeeFinishedWork;
}

#pragma mark -
#pragma mark Private Methods

- (void)enqueueObject:(id)object {
	[self.mutableObjects addObject:object];
}

- (id)dequeueObject {
	NSMutableArray *queue = self.mutableObjects;
	id object = [[[queue firstObject] retain] autorelease];
	if (nil != object) {
		[queue removeObject:object];
	}
	
	return object;
}

#pragma mark -
#pragma mark FXMoneyFlow Protocol Methods

// optional
- (NSInteger)earningsAmount {
	return self.wallet;
}

// required
- (BOOL)ableToPayMoney:(NSInteger)money {
	return self.wallet >= money ? YES : NO;
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
		NSLog(@"%@ sel -> %@, notify: %@", employee, NSStringFromSelector(_cmd), self);
	}
}

- (void)employeeDidStartWork:(FXEmployee *)employee {
	
}

- (void)employeeDidFinishWork:(FXEmployee *)employee {
	@synchronized (self) {
		NSLog(@"%@ sel -> %@, notify: %@", employee, NSStringFromSelector(_cmd), self);
		[self performEmployeeSpecificJobWithObject:employee];
		
		employee.state = kFXEmployeeIsReady;
	}
}

@end
