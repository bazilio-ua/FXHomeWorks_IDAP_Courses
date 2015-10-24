//
//  FXCache.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/22/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FXCache : NSObject

+ (id)sharedCache;

- (void)addObject:(id)object forKey:(id)key;
- (void)removeObjectForKey:(id)key;

- (id)objectForKey:(id)key;
- (BOOL)containsObjectForKey:(id)key;

- (void)removeAllObjects;

- (NSUInteger)count;

@end
