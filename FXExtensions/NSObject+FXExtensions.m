//
//  FXCreature+FXExtensions.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/10/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "NSObject+FXExtensions.h"

@implementation NSObject (FXExtensions)

#pragma mark -
#pragma mark Class Methods

+ (id)object {
	return [[[self alloc] init] autorelease];
}

@end
