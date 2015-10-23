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

- (id)objectForKey:(id)key {
	FXAssignReference *reference = [super objectForKey:key];
	
	return reference.target;
}

#pragma mark -
#pragma mark NSMutableDictionary

- (void)setObject:(id)object forKey:(id)key {
	FXAssignReference *reference = [[[FXAssignReference alloc] initWithTarget:object] autorelease];
	[super setObject:reference forKey:key];
}

@end
