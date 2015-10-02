//
//  FXArrayModelChanges.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/2/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FXArrayModelChangesOneIndex;
@class FXArrayModelChangesTwoIndices;

typedef enum {
	kFXArrayModelChangesAdding,
	kFXArrayModelChangesRemoving,
	kFXArrayModelChangesMoving
} FXArrayModelChangesState;

@interface FXArrayModelChanges : NSObject
@property (nonatomic, readonly)	FXArrayModelChangesState	state;

+ (id)modelWithState:(FXArrayModelChangesState)state;

- (id)initWithState:(FXArrayModelChangesState)state;

@end

@interface FXArrayModelChanges (FXInitializers)

+ (FXArrayModelChangesOneIndex *)addModelWithIndex:(NSUInteger)index;
+ (FXArrayModelChangesOneIndex *)removeModelWithIndex:(NSUInteger)index;
+ (FXArrayModelChangesTwoIndices *)moveModelWithIndex:(NSUInteger)fromIndex 
											  toIndex:(NSUInteger)toIndex;

@end

@interface FXArrayModelChanges (FXIndexPathInitializers)

+ (FXArrayModelChangesOneIndex *)addModelWithIndexPath:(NSIndexPath *)indexPath;
+ (FXArrayModelChangesOneIndex *)removeModelWithIndexPath:(NSIndexPath *)indexPath;
+ (FXArrayModelChangesTwoIndices *)moveModelFromIndexPath:(NSIndexPath *)fromIndexPath 
											  toIndexPath:(NSIndexPath *)toIndexPath;

@end
