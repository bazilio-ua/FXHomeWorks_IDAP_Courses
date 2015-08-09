//
//  FXEmployee.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXEmployee.h"

@implementation FXEmployee
@synthesize wallet		= _wallet;
@synthesize busy		= _busy;
//@synthesize employeeState		= _employeeState;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
	self = [super init]; // init superclass
	
	if (self) {
		self.wallet = 0;
		self.busy = NO;
//		self.employeeState = kFXEmployeeIsReady;
	}
	
	return self;
}

#pragma mark -
#pragma mark Overloaded Methods

- (SEL)selectorForState:(NSUInteger)state {
	SEL selector;
	switch (state) {
		case kFXEmployeeIsReady:
			selector =  @selector(employeeIsReady:);
			break;
			
		case kFXEmployeeStartedWork:
			selector =  @selector(employeeDidStartedWork:);
			break;

		case kFXEmployeeFinishedWork:
			selector =  @selector(employeeDidFinishedWork:);
			break;

		default:
			selector = [super selectorForState:state]; // raise exception on super, its OK.
			break;
	}
	
	return selector;
}

#pragma mark -
#pragma mark Public Methods

- (void)performEmployeeSpecificJobForMoney:(NSInteger)money fromObject:(id<FXMoneyFlow>)object {
	[self receiveMoney:money fromPayer:object];
}

#pragma mark -
#pragma mark FXMoneyFlow Protocol optional Methods

- (NSInteger)getEarningsAmount {
	return self.wallet;
}

#pragma mark -
#pragma mark FXMoneyFlow Protocol required Methods

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

@end
