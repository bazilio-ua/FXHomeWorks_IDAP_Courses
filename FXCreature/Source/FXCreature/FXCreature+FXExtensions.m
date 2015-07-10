//
//  FXCreature+FXExtensions.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/10/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXCreature+FXExtensions.h"

@implementation FXCreature (FXExtensions)
@dynamic className;

#pragma mark -
#pragma mark Class Methods

+ (id)object {
	return [[[self alloc] init] autorelease];
}

#pragma mark -
#pragma mark Class Accessors

- (NSString *)className {
	return NSStringFromClass([self class]);
}

@end
