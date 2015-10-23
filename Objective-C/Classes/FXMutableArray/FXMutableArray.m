//
//  FXMutableArray.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/24/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXMutableArray.h"

@interface FXMutableArray ()
@property (nonatomic, retain) NSMutableArray	*array;

@end

@implementation FXMutableArray

@synthesize array = _array;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	self.array = nil;
	
	[super dealloc];
}

- (id)init {
	self = [super init];
	if (self) {
		self.array = [NSMutableArray array];
	}
	
	return self;
}

- (id)initWithCapacity:(NSUInteger)capacity {
	self = [super init];
	if (self) {
		self.array = [NSMutableArray arrayWithCapacity:capacity];
	}
	
	return self;
}

#pragma mark -
#pragma mark NSArray

- (NSUInteger)count {
	return [self.array count];
}

- (id)objectAtIndex:(NSUInteger)index {
	return [self.array objectAtIndex:index];
}

#pragma mark -
#pragma mark NSMutableArray

- (void)insertObject:(id)object atIndex:(NSUInteger)index {
	[self.array insertObject:object atIndex:index];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
	[self.array removeObjectAtIndex:index];
}

- (void)addObject:(id)object {
	[self.array addObject:object];
}

- (void)removeLastObject {
	[self.array removeLastObject];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object {
	[self.array replaceObjectAtIndex:index withObject:object];
}

@end
