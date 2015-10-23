//
//  NSArray+FXExtensions.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/19/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "NSArray+FXExtensions.h"

#import "FXWeakMutableArray.h"

@implementation NSArray (FXExtensions)

- (id)firstObject {
	return [self count] ? [self objectAtIndex:0] : nil;
}

@end

@implementation NSMutableArray (FXExtensions)

+ (NSMutableArray *)weakArray {
	return [FXWeakMutableArray array];
}

@end