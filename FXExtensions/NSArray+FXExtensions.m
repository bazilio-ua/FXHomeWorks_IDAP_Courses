//
//  NSArray+FXExtensions.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/19/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "NSArray+FXExtensions.h"

@implementation NSArray (FXExtensions)

- (id)firstObj {
	return [self count] ? [self objectAtIndex:0] : nil;
}

@end
