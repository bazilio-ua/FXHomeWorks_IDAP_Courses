//
//  FXWeakMutableDictionary.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/24/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXWeakMutableDictionary.h"

#import "FXWeakMutableArray.h"
#import "FXAssignReference.h"

#import "NSArray+FXExtensions.h"

@implementation FXWeakMutableDictionary

#pragma mark -
#pragma mark NSDictionary

- (id)initWithObjects:(NSArray *)objects forKeys:(NSArray *)keys {
	self = [super init];
	if (self) {
		NSMutableArray *weakObjects = [FXWeakMutableArray weakArray];
		[weakObjects addObjectsFromArray:objects];
		self.dictionary = [NSMutableDictionary dictionaryWithObjects:weakObjects 
															 forKeys:keys];
	}
	
	return self;
}

- (id)objectForKey:(id)aKey {
	FXAssignReference *reference = [super objectForKey:aKey];
	
	return reference.target;
}

#pragma mark -
#pragma mark NSMutableDictionary

- (void)setObject:(id)anObject forKey:(id)aKey {
	FXAssignReference *reference = [[[FXAssignReference alloc] initWithTarget:anObject] autorelease];
	[super setObject:reference forKey:aKey];
}

@end
