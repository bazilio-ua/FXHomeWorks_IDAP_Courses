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
	
	id object = [self objectAtIndex:fromIndex];
	[self removeObjectAtIndex:fromIndex];
	[self insertObject:object atIndex:toIndex];
}

- (void)moveObjectToFirstAtIndex:(NSUInteger)index {
	[self moveObjectAtIndex:index toIndex:0];
}

@end
