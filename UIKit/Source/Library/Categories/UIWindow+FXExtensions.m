//
//  UIWindow+FXExtensions.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/15/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "UIWindow+FXExtensions.h"

@implementation UIWindow (FXExtensions)

+ (id)window {
	return [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
