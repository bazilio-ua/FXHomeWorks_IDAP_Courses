//
//  UIViewController+FXExtensions.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/11/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (FXExtensions)

+ (id)controller;

// Method to be overridden in subclasses to implement custom search of NIB's name.
// In case, nil is return value nib file's name is searched according to Apple guides.
+ (NSString *)nibName;

@end
