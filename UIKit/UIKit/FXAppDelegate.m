//
//  FXAppDelegate.m
//  UIKit
//
//  Created by Basil Nikityuk on 9/8/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXAppDelegate.h"

#import "FXSquareViewController.h"
#import "FXSquareModel.h"

#import "UIViewController+FXInitialization.h"

@implementation FXAppDelegate

@synthesize window			= _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
    // Override point for customization after application launch.
	FXSquareViewController *controller = [FXSquareViewController controller];
	controller.squareModel = [FXSquareModel new];
	
	window.rootViewController = controller;
    [window makeKeyAndVisible];
	self.window = window;
	
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
	
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	
}

- (void)applicationWillTerminate:(UIApplication *)application {
	
}

@end
