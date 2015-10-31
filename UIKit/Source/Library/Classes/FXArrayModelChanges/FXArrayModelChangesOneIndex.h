//
//  FXArrayModelChangesOneIndex.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/2/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXArrayModelChanges.h"

@interface FXArrayModelChangesOneIndex : FXArrayModelChanges
@property (nonatomic, readonly)	NSUInteger	index;

+ (id)modelWithIndex:(NSUInteger)index state:(FXArrayModelChangesState)state;

- (id)initWithIndex:(NSUInteger)index state:(FXArrayModelChangesState)state;

@end

@interface FXArrayModelChangesOneIndex (FXIndexPath)
@property (nonatomic, readonly)	NSIndexPath	*indexPath;

+ (id)modelWithIndexPath:(NSIndexPath *)indexPath state:(FXArrayModelChangesState)state;

@end
