//
//  FXArrayModelChanges.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/2/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXArrayModelChanges.h"

#import "FXArrayModelChangesOneIndex.h"
#import "FXArrayModelChangesTwoIndices.h"

@interface FXArrayModelChanges ()
@property (nonatomic, assign)	FXArrayModelChangesState	state;

@end

@implementation FXArrayModelChanges

@synthesize state = _state;

#pragma mark -
#pragma mark Class Methods

+ (id)modelWithState:(FXArrayModelChangesState)state {
	return [[self alloc] initWithState:state];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)initWithState:(FXArrayModelChangesState)state {
	self = [super init];
	if (self) {
		self.state = state;
	}
	
	return self;
}

@end

@implementation FXArrayModelChanges (FXInitializers)

#pragma mark -
#pragma mark Class Methods

+ (FXArrayModelChangesOneIndex *)addModelWithIndex:(NSUInteger)index {
	return [FXArrayModelChangesOneIndex modelWithIndex:index 
												 state:kFXArrayModelChangesAdding];
}

+ (FXArrayModelChangesOneIndex *)removeModelWithIndex:(NSUInteger)index {
	return [FXArrayModelChangesOneIndex modelWithIndex:index 
												 state:kFXArrayModelChangesRemoving];
}

+ (FXArrayModelChangesTwoIndices *)moveModelWithIndex:(NSUInteger)fromIndex 
											  toIndex:(NSUInteger)toIndex 
{
	return [FXArrayModelChangesTwoIndices modelFromIndex:fromIndex 
												 toIndex:toIndex 
												   state:kFXArrayModelChangesMoving];
}

@end

@implementation FXArrayModelChanges (FXIndexPathInitializers)

#pragma mark -
#pragma mark Class Methods

+ (FXArrayModelChangesOneIndex *)addModelWithIndexPath:(NSIndexPath *)indexPath {
	return [FXArrayModelChangesOneIndex modelWithIndexPath:indexPath 
													 state:kFXArrayModelChangesAdding];
}

+ (FXArrayModelChangesOneIndex *)removeModelWithIndexPath:(NSIndexPath *)indexPath {
	return [FXArrayModelChangesOneIndex modelWithIndexPath:indexPath 
													 state:kFXArrayModelChangesRemoving];
}

+ (FXArrayModelChangesTwoIndices *)moveModelFromIndexPath:(NSIndexPath *)fromIndexPath 
											  toIndexPath:(NSIndexPath *)toIndexPath 
{
	return [FXArrayModelChangesTwoIndices modelFromIndexPath:fromIndexPath 
												 toIndexPath:toIndexPath 
													   state:kFXArrayModelChangesMoving];
}

@end
