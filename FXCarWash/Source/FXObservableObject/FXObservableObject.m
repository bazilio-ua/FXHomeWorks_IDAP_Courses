//
//  FXObservableObject.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/9/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXObservableObject.h"

#import "FXAssignReference.h"

@interface FXObservableObject ()
@property (nonatomic, retain)	NSMutableSet		*mutableObservers;

@end

@implementation FXObservableObject

@synthesize mutableObservers	= _mutableObservers;

@dynamic	observers;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	self.mutableObservers = nil;
	
	[super dealloc];
}

- (id)init {
	self = [super init];
	if (self) {
		self.mutableObservers = [NSMutableSet set];
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Accessors

- (NSSet *)observers {
	id syncObservers = self.mutableObservers;
	@synchronized(syncObservers) {
		NSMutableSet *observers = [NSMutableSet set];
		for (FXReference *reference in syncObservers) {
			[observers addObject:reference.target];
		}
		
		return [[observers copy] autorelease];
	}
}

#pragma mark -
#pragma mark Public Methods

- (void)addObserver:(id)observer {
	id syncObservers = self.mutableObservers;
	@synchronized(syncObservers) {
		[syncObservers addObject:[[[FXAssignReference alloc] initWithTarget:observer] autorelease]];
	}
}

- (void)removeObserver:(id)observer {
	id syncObservers = self.mutableObservers;
	@synchronized(syncObservers) {
		[syncObservers removeObject:[[[FXAssignReference alloc] initWithTarget:observer] autorelease]];
	}
}

- (BOOL)containsObserver:(id)observer {
	id syncObservers = self.mutableObservers;
	@synchronized(syncObservers) {
		return [syncObservers containsObject:[[[FXAssignReference alloc] initWithTarget:observer] autorelease]];
	}
}

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object onMainThread:(BOOL)onMainThread {
	id syncObservers = self.mutableObservers;
	@synchronized(syncObservers) {
		for (FXReference *reference in syncObservers) {
			if ([reference.target respondsToSelector:selector]) {
				if (YES == onMainThread) {
					[reference.target performSelectorOnMainThread:selector withObject:object waitUntilDone:YES];
				} else {
					[reference.target performSelector:selector withObject:object];
				}
			}
		}
	}
}

@end
