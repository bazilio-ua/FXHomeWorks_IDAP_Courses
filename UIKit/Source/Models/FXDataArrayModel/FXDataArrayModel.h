//
//  FXDataArrayModel.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FXObservableObject.h"

@interface FXDataArrayModel : FXObservableObject
@property (nonatomic, readonly)	NSArray	*dataArray;

- (void)addObject:(id)object;
- (void)removeObject:(id)object;

- (void)insertObjectAtIndex:(id)object index:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;

- (id)objectAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;

- (NSUInteger)count;

@end
