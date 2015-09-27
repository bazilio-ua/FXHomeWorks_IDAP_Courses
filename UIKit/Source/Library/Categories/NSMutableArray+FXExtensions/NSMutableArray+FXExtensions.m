//
//  NSMutableArray+FXExtensions.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/27/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "NSMutableArray+FXExtensions.h"

@implementation NSMutableArray (FXExtensions)

- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
	if (fromIndex == toIndex) {
		return;
	}
	
	NSUInteger count = [self count];
	
	NSAssert(fromIndex < count, NSRangeException);
	NSAssert(toIndex < count, NSRangeException);
	
	id movingObject = [self objectAtIndex:fromIndex];
	if (fromIndex < toIndex) {
		for (NSUInteger index = fromIndex; index <= toIndex; index++) {
			[self replaceObjectAtIndex:index 
							withObject:(index == toIndex) ? movingObject : [self objectAtIndex:index + 1]];
		}
	} else {
		id currentObject = nil;
		id previousObject = nil;
		for (NSUInteger index = toIndex; index <= fromIndex; index++) {
			previousObject = currentObject;
			currentObject = [self objectAtIndex:index];
			[self replaceObjectAtIndex:index 
							withObject:(index == toIndex) ? movingObject : previousObject];
		}
	}
}

@end
