//
//  FXObservable.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/9/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXObservable.h"

#import "FXAssignReference.h"

@interface FXObservable ()
@property (nonatomic, retain)	NSMutableSet		*mutableObservers;

@end

@implementation FXObservable

@synthesize mutableObservers	= _mutableObservers;

@dynamic	observers;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	self.mutableObservers = nil;
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
	self = [super init]; // init superclass
	
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
	@synchronized(_mutableObservers) {
		[_mutableObservers addObject:[[[FXAssignReference alloc] initWithTarget:observer] autorelease]];
	}
}

- (void)removeObserver:(id)observer {
	@synchronized(_mutableObservers) {
		[_mutableObservers removeObject:[[[FXAssignReference alloc] initWithTarget:observer] autorelease]];
	}
}

- (BOOL)containsObserver:(id)observer {
	@synchronized(_mutableObservers) {
		return [_mutableObservers containsObject:[[[FXAssignReference alloc] initWithTarget:observer] autorelease]];
	}
}

#pragma mark -
#pragma mark Private Methods

//- (void)notifyObserversWithSelector:(SEL)selector {
//	[self notifyObserversWithSelector:selector withObject:self];
//}

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object onMainThread:(BOOL)mainThread {
	@synchronized(_mutableObservers) {
		for (FXReference *reference in _mutableObservers) {
			if ([reference.target respondsToSelector:selector]) {
                if (YES == mainThread) {
                    [reference.target performSelectorOnMainThread:selector withObject:object waitUntilDone:YES];
                } else {
                    [reference.target performSelector:selector withObject:object];
                }
			}
		}
	}
}

@end
