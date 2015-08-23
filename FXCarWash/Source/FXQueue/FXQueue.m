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
	// release all retained properties
	self.mutableQueue = nil;
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
	self = [super init]; // init superclass
	
	if (self) {
		self.mutableQueue = [NSMutableArray array];
	}
	
	return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)queue {
	return [[self.mutableQueue copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)enqueueObject:(id)object {
	[self.mutableQueue addObject:object];
	NSLog(@"object %@ added to queue %@", object, self);
}

- (id)dequeueObject {
	NSMutableArray *queue = self.mutableQueue;
	id object = [[[queue firstObject] retain] autorelease]; // get first
	if (nil != object) {
		[queue removeObject:object];
		NSLog(@"object %@ removed from queue %@", object, self);
	}
	
	return object;
}

@end
