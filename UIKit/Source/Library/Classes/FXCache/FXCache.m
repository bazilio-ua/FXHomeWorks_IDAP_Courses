//
//  FXCache.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/22/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXCache.h"

#import "FXWeakMutableDictionary.h"

@interface FXCache ()
@property (nonatomic, strong)	FXWeakMutableDictionary	*weakMutableDictionary;

@end

@implementation FXCache

@synthesize weakMutableDictionary	= _weakMutableDictionary;

#pragma mark -
#pragma mark Class Methods

+ (id)cache {
	static FXCache *__cache = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		__cache = [[self alloc] init];
	});
	
	return __cache;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)init {
	self = [super init];
	if (self) {
		self.weakMutableDictionary = [FXWeakMutableDictionary dictionary];
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)addObject:(id)object forKey:(id)key {
	@synchronized(self) {
		[self.weakMutableDictionary setObject:object forKey:key];
	}
}

- (void)removeObjectForKey:(id)key {
	@synchronized(self) {
		[self.weakMutableDictionary removeObjectForKey:key];
	}
}

- (id)objectForKey:(id)key {
	@synchronized(self) {
		return [self.weakMutableDictionary objectForKey:key];
	}
}

- (BOOL)containsObjectForKey:(id)key {
	@synchronized(self) {
		return nil != [self.weakMutableDictionary objectForKey:key];
	}
}

- (void)removeAllObjects {
	@synchronized(self) {
		[self.weakMutableDictionary removeAllObjects];
	}
}

- (NSUInteger)count {
	@synchronized(self) {
		return [self.weakMutableDictionary count];
	}
}

@end
