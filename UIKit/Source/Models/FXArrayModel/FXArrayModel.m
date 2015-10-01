//
//  FXArrayModel.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXArrayModel.h"

#import "FXArrayModelObserver.h"

#import "NSMutableArray+FXExtensions.h"

@interface FXArrayModel ()
@property (nonatomic, strong)	NSMutableArray	*mutableArray;

@end

@implementation FXArrayModel

@synthesize mutableArray	= _mutableArray;
@synthesize state 			= _state;

@dynamic array;

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)init {
	self = [super init];
	if (self) {
		self.mutableArray = [NSMutableArray array];
	}
	
	return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)array {
	return [self.mutableArray copy];
}

- (void)setState:(FXArrayModelState)state {
	if (state != _state) {
		_state = state;
	}
	
	[self notifyObserversWithSelector:[self selectorForState:state] withObject:self];
}

#pragma mark -
#pragma mark Overloaded Methods

- (SEL)selectorForState:(FXArrayModelState)state {
	SEL selector = NULL;
	switch (state) {
		case kFXArrayModelDidChange:
			selector = @selector(arrayModelDidChange:);
			break;
			
		default:
			break;
	}
	
	return selector;
}

#pragma mark -
#pragma mark Public Methods

- (void)addObject:(id)object {
	[self.mutableArray addObject:object];
	
	self.state = kFXArrayModelDidChange;
}

- (void)removeObject:(id)object {
	[self.mutableArray removeObject:object];
	
	self.state = kFXArrayModelDidChange;
}

- (void)insertObjectAtIndex:(id)object index:(NSUInteger)index {
	[self.mutableArray insertObject:object atIndex:index];
	
	self.state = kFXArrayModelDidChange;
}

- (void)removeObjectAtIndex:(NSUInteger)index {
	if (index < [self count]) {
		[self.mutableArray removeObjectAtIndex:index];
	}
	
	self.state = kFXArrayModelDidChange;
}

- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
	[self.mutableArray moveObjectAtIndex:fromIndex toIndex:toIndex];
	
	self.state = kFXArrayModelDidChange;
}

- (NSUInteger)indexOfObject:(id)object {
	return [self.mutableArray indexOfObject:object];
}

- (id)objectAtIndex:(NSUInteger)index {
	return [self.mutableArray objectAtIndex:index];
}

/*
 -objectAtIndexedSubscript: for NSArray* does the exact same thing as -objectAtIndex:
 */
- (id)objectAtIndexedSubscript:(NSUInteger)index {
	return [self.mutableArray objectAtIndex:index];
}

- (NSUInteger)count {
	return [self.mutableArray count];
}

@end
