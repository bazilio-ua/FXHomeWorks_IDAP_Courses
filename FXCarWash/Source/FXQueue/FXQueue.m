//
//  FXQueue.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/22/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXQueue.h"

#import "NSArray+FXExtensions.h"

@interface FXQueue ()
@property (nonatomic, retain)	NSMutableArray	*mutableQueue;

@end

@implementation FXQueue

@synthesize mutableQueue = _mutableQueue;

@dynamic queue;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	self.mutableQueue = nil;
	
	[super dealloc];
}

- (id)init {
	self = [super init];
	if (self) {
		self.mutableQueue = [NSMutableArray array];
	}
	
	return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)queue {
	id syncQueue = self.mutableQueue;
	@synchronized(syncQueue) {
		return [[syncQueue copy] autorelease];
	}
}

#pragma mark -
#pragma mark Public Methods

- (void)enqueueObject:(id)object {
	id syncQueue = self.mutableQueue;
	@synchronized(syncQueue) {
		if (NO == [syncQueue containsObject:object]) {
			[syncQueue addObject:object];
			NSLog(@"object %@ added to queue %@", object, self);
		}
	}
}

- (id)dequeueObject {
	id syncQueue = self.mutableQueue;
	@synchronized(syncQueue) {
		id object = [[[syncQueue firstObject] retain] autorelease]; // get first
		if (nil != object) {
			[syncQueue removeObject:object];
			NSLog(@"object %@ removed from queue %@", object, self);
		}
		
		return object;
	}
}

- (BOOL)containsObject:(id)object {
	id syncQueue = self.mutableQueue;
	@synchronized(syncQueue) {
		return [syncQueue containsObject:object];
	}	
}

- (BOOL)isEmpty {
	id syncQueue = self.mutableQueue;
	@synchronized(syncQueue) {
		NSLog(@"queue %@ is empty", self);
		return 0 == [syncQueue count];
	}
}

@end
