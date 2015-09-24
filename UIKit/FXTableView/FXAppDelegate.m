//
//  FXAppDelegate.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/19/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXAppDelegate.h"

#import "FXTableViewController.h"
#import "FXDataModel.h"
#import "FXDataArrayModel.h"

#import "UIWindow+FXExtensions.h"
#import "UIViewController+FXExtensions.h"

static const NSUInteger kFXDefaultModelsCount = 10;

@implementation FXAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	UIWindow *window = [UIWindow window];
	self.window = window;
	
    // Override point for customization after application launch.
	FXTableViewController *controller = [FXTableViewController controller];
	controller.dataArrayModel = [[FXDataArrayModel alloc] initWithDataModelsCount:kFXDefaultModelsCount];
	
	window.rootViewController = controller;
    [window makeKeyAndVisible];
	
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
