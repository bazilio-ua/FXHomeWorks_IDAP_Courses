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
	@synchronized(handler) {
		[handler addObserver:self];
		[self.handlers addEmployee:handler];
	}
}

- (void)removeHandler:(FXEmployee *)handler {
	@synchronized(handler) {
		[handler removeObserver:self];
		[self.handlers removeEmployee:handler];
	}
}

- (void)processObject:(id)object {
	
}

@end
