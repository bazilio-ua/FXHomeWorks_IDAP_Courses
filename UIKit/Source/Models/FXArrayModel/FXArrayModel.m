//
//  FXArrayModel.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXArrayModel.h"

#import "NSMutableArray+FXExtensions.h"

@interface FXArrayModel ()
@property (nonatomic, strong)	NSMutableArray	*mutableArray;

@end

@implementation FXArrayModel

@synthesize mutableArray = _mutableArray;

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

#pragma mark -
#pragma mark Public Methods

- (void)addObject:(id)object {
	[self.mutableArray addObject:object];
}

- (void)removeObject:(id)object {
	[self.mutableArray removeObject:object];
}

- (void)insertObjectAtIndex:(id)object index:(NSUInteger)index {
	[self.mutableArray insertObject:object atIndex:index];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
	if (index < [self count]) {
		[self.mutableArray removeObjectAtIndex:index];
	}
}

- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
	[self.mutableArray moveObjectAtIndex:fromIndex toIndex:toIndex];
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
