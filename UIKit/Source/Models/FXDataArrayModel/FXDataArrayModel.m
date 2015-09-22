//
//  FXDataArrayModel.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXDataArrayModel.h"

@interface FXDataArrayModel ()
@property (nonatomic, strong)	NSMutableArray *mutableDataArray;

@end

@implementation FXDataArrayModel

@synthesize mutableDataArray = _mutableDataArray;

@dynamic dataArray;

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)init {
	self = [super init];
	if (self) {
		self.mutableDataArray = [NSMutableArray array];
	}
	
	return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)dataArray {
	return [self.mutableDataArray copy];
}

#pragma mark -
#pragma mark Public Methods

- (void)addObject:(id)object {
	[self.mutableDataArray addObject:object];
}

- (void)removeObject:(id)object {
	[self.mutableDataArray removeObject:object];
}

- (void)insertObjectAtIndex:(id)object index:(NSUInteger)index {
	[self.mutableDataArray insertObject:object atIndex:index];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
	[self.mutableDataArray removeObjectAtIndex:index];
}

- (id)objectAtIndex:(NSUInteger)index {
	return [self.mutableDataArray objectAtIndex:index];
}

/*
 -objectAtIndexedSubscript: for NSArray* does the exact same thing as -objectAtIndex:
 */
- (id)objectAtIndexedSubscript:(NSUInteger)index {
	return [self.mutableDataArray objectAtIndex:index];
}

- (NSUInteger)count {
	return [self.mutableDataArray count];
}

@end
