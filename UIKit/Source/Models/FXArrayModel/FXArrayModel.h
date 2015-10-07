//
//  FXArrayModel.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FXObservableObject.h"

typedef enum {
	kFXArrayModelUnloaded,
	kFXArrayModelLoading,
	kFXArrayModelLoaded,
	kFXArrayModelFailedLoading,
	kFXArrayModelDidChange
} FXArrayModelState;

@interface FXArrayModel : FXObservableObject <NSFastEnumeration>
@property (nonatomic, readonly)	NSArray				*array;
@property (nonatomic, assign)	FXArrayModelState	state;

- (void)setState:(FXArrayModelState)state withChanges:(id)changes;
- (SEL)selectorForState:(FXArrayModelState)state;

- (void)addObject:(id)object;
- (void)removeObject:(id)object;

- (void)insertObjectAtIndex:(id)object index:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

- (BOOL)containsObject:(id)object;
- (NSUInteger)indexOfObject:(id)object;

- (id)objectAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;

- (NSUInteger)count;

@end
