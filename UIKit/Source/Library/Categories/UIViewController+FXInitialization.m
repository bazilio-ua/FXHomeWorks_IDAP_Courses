//
//  UIViewController+FXInitialization.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/11/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "UIViewController+FXInitialization.h"

@implementation UIViewController (FXInitialization)

+ (id)newViewControllerWithDefaultNib {
	return [[self alloc] initWithNibName:NSStringFromClass(self) bundle:nil];
}

//+ (id)viewControllerWithDefaultNib {
//	return [[self newViewControllerWithDefaultNib] autorelease];
//}

@end
