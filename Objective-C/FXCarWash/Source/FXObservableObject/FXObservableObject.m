//
//  FXObservableObject.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/9/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXObservableObject.h"

#import "FXAssignReference.h"

#import "FXDispatch.h"

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
	@synchronized(self.mutableObservers) {
		NSMutableSet *observers = [NSMutableSet set];
		for (FXReference *reference in self.mutableObservers) {
			[observers addObject:reference.target];
		}
		
		return [[observers copy] autorelease];
	}
}

#pragma mark -
#pragma mark Public Methods

- (void)addObserver:(id)observer {
	@synchronized(self.mutableObservers) {
		[self.mutableObservers addObject:[[[FXAssignReference alloc] initWithTarget:observer] autorelease]];
	}
}

- (void)removeObserver:(id)observer {
	@synchronized(self.mutableObservers) {
		[self.mutableObservers removeObject:[[[FXAssignReference alloc] initWithTarget:observer] autorelease]];
	}
}

- (BOOL)containsObserver:(id)observer {
	@synchronized(self.mutableObservers) {
		return [self.mutableObservers containsObject:[[[FXAssignReference alloc] initWithTarget:observer] autorelease]];
	}
}

- (void)notifyObserversWithSelector:(SEL)selector {
	[self notifyObserversWithSelector:selector withObject:self];
}

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object {
	[self notifyObserversWithSelector:selector withObject:object withObject:nil];
}

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object withObject:(id)anotherObject {
	for (FXReference *reference in self.mutableObservers) {
		if ([reference.target respondsToSelector:selector]) {
			FXDispatchSyncOnMainQueueWithBlock(^{
				[reference.target performSelector:selector withObject:object withObject:anotherObject];
			});
		}
	}
}

@end
