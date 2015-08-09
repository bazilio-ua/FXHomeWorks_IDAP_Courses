//
//  FXObservableObject.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/9/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXObservableObject.h"

@interface FXObservableObject ()
@property (nonatomic, retain)	NSMutableSet		*mutableObservers;

- (void)notifyOfStateChangeWithSelector:(SEL)selector;

@end

@implementation FXObservableObject
@synthesize state 				= _state;
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
	return [[self.mutableObservers copy] autorelease];
}

- (void)setState:(NSUInteger)state {
	if (state != _state) {
		_state = state;
		
		[self notifyOfStateChangeWithSelector:[self selectorForState:state]];
	}
}

#pragma mark -
#pragma mark Public Methods

- (void)addObserver:(id)observer {
	[self.mutableObservers addObject:observer];
}

- (void)removeObserver:(id)observer {
	[self.mutableObservers removeObject:observer];
}

- (BOOL)containsObserver:(id)observer {
	return [self.mutableObservers containsObject:observer];
}

#pragma mark -
#pragma mark Private Methods

- (SEL)selectorForState:(NSUInteger)state {
	[self doesNotRecognizeSelector:_cmd];
	
	return NULL;
}

- (void)notifyOfStateChangeWithSelector:(SEL)selector {
	NSMutableSet *observers = self.mutableObservers;
	for (id observer in observers) {
		if ([observer respondsToSelector:selector]) {
			[observer performSelector:selector withObject:self];
		}
	}
}

@end
