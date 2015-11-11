//
//  UINavigationController+FXExtensions.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "UINavigationController+FXExtensions.h"

@implementation UINavigationController (FXExtensions)

#pragma mark -
#pragma mark Class Methods

+ (id)navigationControllerWithRootViewController:(UIViewController *)controller {
	return [[self alloc] initWithRootViewController:controller];
}

@end
