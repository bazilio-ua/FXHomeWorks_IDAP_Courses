//
//  FXArrayModel.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXArrayModel.h"

#import "FXArrayModelChanges.h"

#import "NSMutableArray+FXExtensions.h"

static NSString * const kFXDefaultArrayName = @"mutableArray";

@interface FXArrayModel ()
@property (nonatomic, strong)	NSMutableArray	*mutableArray;

@end

@implementation FXArrayModel

@synthesize mutableArray	= _mutableArray;

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
	if (![self containsObject:object]) {
		[self.mutableArray addObject:object];
		
		[self setState:kFXModelDidChange withChanges:[FXArrayModelChanges addModelWithIndex:([self count] - 1)]];
	}
}

- (void)removeObject:(id)object {
	if ([self containsObject:object]) {
		NSUInteger index = [self indexOfObject:object];
		[self.mutableArray removeObject:object];
		
		[self setState:kFXModelDidChange withChanges:[FXArrayModelChanges removeModelWithIndex:index]];
	}
}

- (void)insertObjectAtIndex:(id)object index:(NSUInteger)index {
	if (![self containsObject:object] && index < [self count]) {
		[self.mutableArray insertObject:object atIndex:index];
		
		[self setState:kFXModelDidChange withChanges:[FXArrayModelChanges addModelWithIndex:index]];
	}
}

- (void)removeObjectAtIndex:(NSUInteger)index {
	if (index < [self count]) {
		[self.mutableArray removeObjectAtIndex:index];
		
		[self setState:kFXModelDidChange withChanges:[FXArrayModelChanges removeModelWithIndex:index]];
	}
}

- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
	NSUInteger count = [self count];
	if (fromIndex < count && toIndex < count) {
		[self.mutableArray moveObjectAtIndex:fromIndex toIndex:toIndex];
		
		[self setState:kFXModelDidChange withChanges:[FXArrayModelChanges moveModelFromIndex:fromIndex 
																						  toIndex:toIndex]];
	}
}

- (BOOL)containsObject:(id)object {
	return [self.mutableArray containsObject:object];
}

- (NSUInteger)indexOfObject:(id)object {
	return [self.mutableArray indexOfObject:object];
}

- (id)objectAtIndex:(NSUInteger)index {
	return [self.mutableArray objectAtIndex:index];
}

/* -objectAtIndexedSubscript: for NSArray* does the exact same thing as -objectAtIndex: */
- (id)objectAtIndexedSubscript:(NSUInteger)index {
	return [self.mutableArray objectAtIndex:index];
}

- (NSUInteger)count {
	return [self.mutableArray count];
}

#pragma mark -
#pragma mark NSFastEnumeration protocol

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state 
								  objects:(__unsafe_unretained id[])buffer 
									count:(NSUInteger)len 
{
	return [self.mutableArray countByEnumeratingWithState:state 
												  objects:buffer 
													count:len];
}

#pragma mark -
#pragma mark NSCoding protocol

- (id)initWithCoder:(NSCoder *)decoder {
	self = [super init];
	if (self) {
		self.mutableArray = [decoder decodeObjectForKey:kFXDefaultArrayName];
	}
	
	return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.mutableArray forKey:kFXDefaultArrayName];
}

@end
