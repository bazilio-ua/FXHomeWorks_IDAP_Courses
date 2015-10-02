//
//  FXArrayModelChangesTwoIndices.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/2/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXArrayModelChangesTwoIndices.h"

#import "NSIndexPath+FXExtensions.h"

@interface FXArrayModelChangesTwoIndices ()
@property (nonatomic, assign)	NSUInteger	fromIndex;
@property (nonatomic, assign)	NSUInteger	toIndex;

@end

@implementation FXArrayModelChangesTwoIndices

@synthesize fromIndex	= _fromIndex;
@synthesize toIndex		= _toIndex;

#pragma mark -
#pragma mark Class Methods

+ (id)modelFromIndex:(NSUInteger)fromIndex 
			 toIndex:(NSUInteger)toIndex 
			   state:(FXArrayModelChangesState)state 
{
	return [[self alloc] initFromIndex:fromIndex 
							   toIndex:toIndex 
								 state:state];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)initFromIndex:(NSUInteger)fromIndex 
			toIndex:(NSUInteger)toIndex 
			  state:(FXArrayModelChangesState)state 
{
	self = [super initWithState:state];
	if (self) {
		self.fromIndex = fromIndex;
		self.toIndex = toIndex;
	}
	
	return self;
}

@end

@implementation FXArrayModelChangesTwoIndices (FXIndexPath)

@dynamic fromIndexPath;
@dynamic toIndexPath;

#pragma mark -
#pragma mark Class Methods

+ (id)modelFromIndexPath:(NSIndexPath *)fromIndexPath 
			 toIndexPath:(NSIndexPath *)toIndexPath 
				   state:(FXArrayModelChangesState)state 
{
	return nil;
}

#pragma mark -
#pragma mark Accessors

- (NSIndexPath *)fromIndexPath {
	return [NSIndexPath indexPathForRow:self.fromIndex];
}

- (NSIndexPath *)toIndexPath {
	return [NSIndexPath indexPathForRow:self.toIndex];
}

@end
