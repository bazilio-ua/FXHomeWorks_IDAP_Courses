//
//  FXAppDelegate.h
//  UIKit
//
//  Created by Basil Nikityuk on 9/8/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FXViewController;

@interface FXAppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong)	UIWindow			*window;
@property (nonatomic, strong)	FXViewController	*viewController;

@end