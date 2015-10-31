//
//  FXArrayModelChangesTwoIndices.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/2/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXArrayModelChanges.h"

@interface FXArrayModelChangesTwoIndices : FXArrayModelChanges
@property (nonatomic, readonly)	NSUInteger	fromIndex;
@property (nonatomic, readonly)	NSUInteger	toIndex;

+ (id)modelFromIndex:(NSUInteger)fromIndex 
			 toIndex:(NSUInteger)toIndex 
			   state:(FXArrayModelChangesState)state;

- (id)initFromIndex:(NSUInteger)fromIndex 
			toIndex:(NSUInteger)toIndex 
			  state:(FXArrayModelChangesState)state;

@end

@interface FXArrayModelChangesTwoIndices (FXIndexPath)
@property (nonatomic, readonly)	NSIndexPath *fromIndexPath;
@property (nonatomic, readonly)	NSIndexPath *toIndexPath;

+ (id)modelFromIndexPath:(NSIndexPath *)fromIndexPath 
			 toIndexPath:(NSIndexPath *)toIndexPath 
				   state:(FXArrayModelChangesState)state;

@end
