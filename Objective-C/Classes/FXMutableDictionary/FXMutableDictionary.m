//
//  FXMutableDictionary.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/23/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXMutableDictionary.h"

@interface FXMutableDictionary ()
@property (nonatomic, retain) NSMutableDictionary	*dictionary;

@end

@implementation FXMutableDictionary

@synthesize dictionary = _dictionary;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	self.dictionary = nil;
	
	[super dealloc];
}

- (id)init {
	self = [super init];
	if (self) {
		self.dictionary = [NSMutableDictionary dictionary];
	}
	
	return self;
}

- (id)initWithCapacity:(NSUInteger)capacity {
	self = [super init];
	if (self) {
		self.dictionary = [NSMutableDictionary dictionaryWithCapacity:capacity];
	}
	
	return self;
}

#pragma mark -
#pragma mark NSDictionary

- (id)initWithObjects:(NSArray *)objects forKeys:(NSArray *)keys {
	self = [super init];
	if (self) {
		self.dictionary = [NSMutableDictionary dictionaryWithObjects:objects 
															 forKeys:keys];
	}
	
	return self;
}

- (NSUInteger)count {
	return [self.dictionary count];
}

- (id)objectForKey:(id)key {
	return [self.dictionary objectForKey:key];
}

- (NSEnumerator *)keyEnumerator {
	return [self.dictionary keyEnumerator];
}

#pragma mark -
#pragma mark NSMutableDictionary

- (void)setObject:(id)object forKey:(id)key {
	[self.dictionary setObject:object forKey:key];
}

- (void)removeObjectForKey:(id)key {
	[self.dictionary removeObjectForKey:key];
}

@end
