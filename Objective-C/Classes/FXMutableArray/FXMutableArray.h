//
//  FXMutableArray.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/24/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FXMutableArray : NSMutableArray

- (id)initWithCapacity:(NSUInteger)capacity;

- (NSUInteger)count;
- (id)objectAtIndex:(NSUInteger)index;
- (void)insertObject:(id)object atIndex:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)addObject:(id)object;
- (void)removeLastObject;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object;

@end
