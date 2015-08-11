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
//@synthesize state 				= _state;
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
	NSMutableSet *observers = [NSMutableSet set];
	for (FXReference *reference in self.mutableObservers) {
		id target = reference.target;
		if (nil != target) {
			[observers addObject:target];
		}
	}
	
	return [[observers copy] autorelease];
}

//- (void)setState:(NSUInteger)state {
//	if (state != _state) {
//		_state = state;
//		
//		[self notifyObserversWithSelector:[self selectorForState:state] withObject:self];
//	}
//}

#pragma mark -
#pragma mark Public Methods

- (void)addObserver:(id)observer {
	[self.mutableObservers addObject:[[[FXAssignReference alloc] initWithTarget:observer] autorelease]];
}

- (void)removeObserver:(id)observer {
	NSArray *observers = [self.mutableObservers allObjects];
	for (FXAssignReference *reference in observers) {
		if (observer == reference.target) {
			[self.mutableObservers removeObject:reference];
			
			break;
		}
	}
}

- (BOOL)containsObserver:(id)observer {
	NSArray *observers = [self.mutableObservers allObjects];
	for (FXAssignReference *reference in observers) {
		if (observer == reference.target) {
			
			return [self.mutableObservers containsObject:reference]; // or just 'YES' ?
		}
	}
	
	return NO;
}

#pragma mark -
#pragma mark Private Methods

//- (SEL)selectorForState:(NSUInteger)state {
//	[self doesNotRecognizeSelector:_cmd];
//	
//	return NULL;
//}

- (void)notifyObserversWithSelector:(SEL)selector {
	[self notifyObserversWithSelector:selector withObject:nil];
}

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object {
	[self notifyObserversWithSelector:selector withObject:object withObject:nil];
}

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object withObject:(id)object2 {
	NSMutableSet *observers = self.mutableObservers;
	for (id observer in observers) {
		if ([observer respondsToSelector:selector]) {
			[observer performSelector:selector withObject:object withObject:object2];
		}
	}
}

@end
