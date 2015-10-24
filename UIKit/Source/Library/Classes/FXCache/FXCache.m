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
@property (nonatomic, strong)	FXWeakMutableDictionary	*cache;

@end

@implementation FXCache

@synthesize cache = _cache;

#pragma mark -
#pragma mark Class Methods

+ (id)sharedCache {
	static FXCache *__sharedCache = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		__sharedCache = [[self alloc] init];
	});
	
	return __sharedCache;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)init {
	self = [super init];
	if (self) {
		self.cache = [FXWeakMutableDictionary dictionary];
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)addObject:(id)object forKey:(id)key {
	@synchronized(self) {
		[self.cache setObject:object forKey:key];
	}
}

- (void)removeObjectForKey:(id)key {
	@synchronized(self) {
		[self.cache removeObjectForKey:key];
	}
}

- (id)objectForKey:(id)key {
	@synchronized(self) {
		return [self.cache objectForKey:key];
	}
}

- (BOOL)containsObjectForKey:(id)key {
	@synchronized(self) {
		return nil != [self.cache objectForKey:key];
	}
}

- (void)removeAllObjects {
	@synchronized(self) {
		[self.cache removeAllObjects];
	}
}

- (NSUInteger)count {
	@synchronized(self) {
		return [self.cache count];
	}
}

@end
