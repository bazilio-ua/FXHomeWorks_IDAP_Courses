//
//  UIViewController+FXExtensions.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/11/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "UIViewController+FXExtensions.h"

@implementation UIViewController (FXExtensions)

+ (id)controller {
	return [[self alloc] initWithNibName:[self nibName] bundle:nil];
}

+ (NSString *)nibName {
	return nil;
}

@end
