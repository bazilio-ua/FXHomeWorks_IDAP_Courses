//
//  FXEmployee.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXEmployee.h"

@interface FXEmployee ()
@property (nonatomic, retain)	id	processedObject;

@end

@implementation FXEmployee
@synthesize wallet			= _wallet;
//@synthesize busy			= _busy;
@synthesize state			= _state;
@synthesize processedObject	= _processedObject;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	self.processedObject = nil;
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
	self = [super init]; // init superclass
	
	if (self) {
		self.wallet = 0;
//		self.busy = NO;
		self.state = kFXEmployeeIsReady;
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
			selector = @selector(employeeDidStartedWork:);
			break;
			
		case kFXEmployeeFinishedWork:
			selector = @selector(employeeDidFinishedWork:);
			break;
			
		default:
			[self doesNotRecognizeSelector:_cmd]; // raise exception
			break;
	}
	
	return selector;
}

#pragma mark -
#pragma mark Public Methods

- (void)performEmployeeSpecificJobWithObject:(id<FXMoneyFlow>)object {
	[self doesNotRecognizeSelector:_cmd];
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

- (void)employeeIsReady:(FXEmployee *)employee {
	NSLog(@"employee: %@, with selector: %@", employee ,NSStringFromSelector(_cmd));
}

- (void)employeeDidStartedWork:(FXEmployee *)employee {
	NSLog(@"employee: %@, with selector: %@", employee ,NSStringFromSelector(_cmd));
}

- (void)employeeDidFinishedWork:(FXEmployee *)employee {
	NSLog(@"employee: %@, with selector: %@", employee ,NSStringFromSelector(_cmd));
	
//	employee.state = kFXEmployeeIsReady;
}

@end
