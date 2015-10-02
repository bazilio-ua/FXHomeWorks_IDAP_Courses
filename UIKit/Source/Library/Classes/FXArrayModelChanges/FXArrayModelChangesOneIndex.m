//
//  FXArrayModelChangesOneIndex.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/2/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXArrayModelChangesOneIndex.h"

#import "NSIndexPath+FXExtensions.h"

@interface FXArrayModelChangesOneIndex ()
@property (nonatomic, assign)	NSUInteger	index;

@end

@implementation FXArrayModelChangesOneIndex

@synthesize index = _index;

#pragma mark -
#pragma mark Class Methods

+ (id)modelWithIndex:(NSUInteger)index state:(FXArrayModelChangesState)state {
	return [[self alloc] initWithIndex:index state:state];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)initWithIndex:(NSUInteger)index state:(FXArrayModelChangesState)state {
	self = [super initWithState:state];
	if (self) {
		self.index = index;
	}
	
	return self;
}

@end

@implementation FXArrayModelChangesOneIndex (FXIndexPath)

@dynamic indexPath;

#pragma mark -
#pragma mark Class Methods

+ (id)modelWithIndexPath:(NSIndexPath *)indexPath state:(FXArrayModelChangesState)state {
	return nil;
}

#pragma mark -
#pragma mark Accessors

- (NSIndexPath *)indexPath {
	return [NSIndexPath indexPathForRow:self.index];
}

@end
