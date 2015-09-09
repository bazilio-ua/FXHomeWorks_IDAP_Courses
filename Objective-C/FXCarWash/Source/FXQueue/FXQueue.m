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
	@synchronized(self.mutableQueue) {
		return [[self.mutableQueue copy] autorelease];
	}
}

#pragma mark -
#pragma mark Public Methods

- (void)enqueueObject:(id)object {
	@synchronized(self.mutableQueue) {
		if (NO == [self.mutableQueue containsObject:object]) {
			[self.mutableQueue addObject:object];
			NSLog(@"object %@ added to queue %@", object, self);
		}
	}
}

- (id)dequeueObject {
	@synchronized(self.mutableQueue) {
		id object = [[[self.mutableQueue firstObject] retain] autorelease]; // get first
		if (nil != object) {
			[self.mutableQueue removeObject:object];
			NSLog(@"object %@ removed from queue %@", object, self);
		}
		
		return object;
	}
}

- (BOOL)containsObject:(id)object {
	@synchronized(self.mutableQueue) {
		return [self.mutableQueue containsObject:object];
	}	
}

- (BOOL)isEmpty {
	@synchronized(self.mutableQueue) {
		if (0 == [self.mutableQueue count]) {
			NSLog(@"queue %@ is empty", self);
			return YES;
		}
		
		return NO;
	}
}

@end
