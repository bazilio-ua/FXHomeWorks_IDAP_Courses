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

- (id)initWithCapacity:(NSUInteger)numItems {
	self = [super init];
	if (self) {
		self.dictionary = [NSMutableDictionary dictionaryWithCapacity:numItems];
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

- (id)objectForKey:(id)aKey {
	return [self.dictionary objectForKey:aKey];
}

- (NSEnumerator *)keyEnumerator {
	return [self.dictionary keyEnumerator];
}

#pragma mark -
#pragma mark NSMutableDictionary

- (void)setObject:(id)anObject forKey:(id)aKey {
	[self.dictionary setObject:anObject forKey:aKey];
}

- (void)removeObjectForKey:(id)aKey {
	[self.dictionary removeObjectForKey:aKey];
}

@end
