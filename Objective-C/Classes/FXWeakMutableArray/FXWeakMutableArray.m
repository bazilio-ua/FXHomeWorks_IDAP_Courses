//
//  FXWeakMutableArray.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/24/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXWeakMutableArray.h"

#import "FXAssignReference.h"

@interface FXWeakMutableArray ()

@end

@implementation FXWeakMutableArray

@dynamic weakReferences;

#pragma mark -
#pragma mark NSArray

- (id)objectAtIndex:(NSUInteger)index {
	FXAssignReference *reference = [super objectAtIndex:index];
	
	return reference.target;
}

#pragma mark -
#pragma mark NSMutableArray

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index {
	FXAssignReference *reference = [[[FXAssignReference alloc] initWithTarget:anObject] autorelease];
	[super insertObject:reference atIndex:index];
}

- (void)addObject:(id)anObject {
	FXAssignReference *reference = [[[FXAssignReference alloc] initWithTarget:anObject] autorelease];
	[super addObject:reference];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
	FXAssignReference *reference = [[[FXAssignReference alloc] initWithTarget:anObject] autorelease];
	[super replaceObjectAtIndex:index withObject:reference];
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)weakReferences {
	NSUInteger count = [self count];
	NSMutableArray *references = [NSMutableArray arrayWithCapacity:count];
	for (NSUInteger index = 0; index < count; index++) {
		[references addObject:[super objectAtIndex:index]];
	}
	
	return [NSArray arrayWithArray:references];
}

@end
