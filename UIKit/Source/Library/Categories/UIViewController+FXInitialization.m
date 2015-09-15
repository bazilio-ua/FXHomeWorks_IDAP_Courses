//
//  UIViewController+FXInitialization.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/11/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "UIViewController+FXInitialization.h"

@implementation UIViewController (FXInitialization)

+ (id)controller {
	return [[self alloc] initWithNibName:NSStringFromClass(self) bundle:nil];
}

+ (id)controllerWithNibName:(NSString *)nibName {
	return [[self alloc] initWithNibName:nibName bundle:nil];
}

@end
