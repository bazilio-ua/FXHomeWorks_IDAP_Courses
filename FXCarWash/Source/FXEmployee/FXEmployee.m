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
@property (nonatomic, retain)	FXQueue		*queue;

@end

@implementation FXEmployee
@synthesize state			= _state;
@synthesize wallet			= _wallet;
@synthesize queue			= _queue;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	self.queue = nil;
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
	self = [super init]; // init superclass
	
	if (self) {
		self.wallet = 0;
		self.state = kFXEmployeeIsReady;
		self.queue = [FXQueue object];
	}
	
	return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(FXEmployeeState)state {
    @synchronized(self) {
        if (state != _state) {
            _state = state;
            
            [self notifyObserversWithSelector:[self selectorForState:state] withObject:self onMainThread:YES];
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

- (void)processObject:(id<FXMoneyFlow, FXEmployeeObserver>)object {
	
}

- (void)performEmployeeSpecificJobWithObject:(id<FXMoneyFlow, FXEmployeeObserver>)object {
	if (nil != object) {
		if (kFXEmployeeIsReady == self.state) {
			self.state = kFXEmployeeStartedWork;
			
			[self performSelectorInBackground:@selector(performEmployeeSpecificJobWithObjectInBackground:) 
								   withObject:object];
		} else {
			NSLog(@"Employee %@ is busy right now", self);
			[self.queue enqueueObject:object];
		}
	}
}

- (void)performEmployeeSpecificJobWithObjectInBackground:(id<FXMoneyFlow, FXEmployeeObserver>)object {
	@autoreleasepool {
		[self processObject:object];
	}
	
	[self performSelectorOnMainThread:@selector(finishEmployeeSpecificJobWithObjectOnMainThread:) 
						   withObject:object 
						waitUntilDone:NO];
}

- (void)finishEmployeeSpecificJobWithObjectOnMainThread:(id<FXMoneyFlow, FXEmployeeObserver>)object {
	FXEmployee *employee = object;
	if (YES == [employee isKindOfClass:[FXEmployee class]]) {
		employee.state = kFXEmployeeIsReady;
	}
	
	id queueObject = [self.queue dequeueObject];
	if (nil != queueObject) {
		[self performSelectorInBackground:@selector(performEmployeeSpecificJobWithObjectInBackground:) 
							   withObject:queueObject];
	} else {
		self.state = kFXEmployeeFinishedWork;
	}
}

#pragma mark -
#pragma mark FXMoneyFlow Protocol Methods

// optional
- (NSInteger)earningAmount {
	return self.wallet;
}

// required
- (BOOL)ableToPayMoney:(NSInteger)money {
	return self.wallet >= money;
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
//	NSLog(@"notified: %@ -> %@ with selector: %@", employee, self, NSStringFromSelector(_cmd));
	
//	if (kFXEmployeeIsReady != employee.state) {
//		NSLog(@" ");
//	}
	
}

- (void)employeeDidStartWork:(FXEmployee *)employee {
//	NSLog(@"notified: %@ -> %@ with selector: %@", employee, self, NSStringFromSelector(_cmd));
	
//	if (kFXEmployeeStartedWork != employee.state) {
//		NSLog(@" ");
//	}
	
}

- (void)employeeDidFinishWork:(FXEmployee *)employee {
//	NSLog(@"notified: %@ -> %@ with selector: %@", employee, self, NSStringFromSelector(_cmd));
	
//	if (kFXEmployeeFinishedWork != employee.state) {
//		NSLog(@" ");
//	}
	
	[self performEmployeeSpecificJobWithObject:employee];
}

@end
