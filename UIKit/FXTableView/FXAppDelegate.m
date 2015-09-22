//
//  FXAppDelegate.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/19/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXAppDelegate.h"

#import "FXTableViewController.h"

#import "UIWindow+FXExtensions.h"
#import "UIViewController+FXExtensions.h"

//
#import "FXDataArrayModel.h"
#import "FXDataModel.h"

@implementation FXAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	UIWindow *window = [UIWindow window];
	self.window = window;
	
	FXDataArrayModel *dataArrayModel = [FXDataArrayModel new];
	for (NSUInteger index = 0; index < 10; index++) {
		[dataArrayModel addObject:[FXDataModel new]];
	}
	
    // Override point for customization after application launch.
	FXTableViewController *controller = [FXTableViewController controller];
	controller.dataModel = [FXDataModel new];
	controller.dataArrayModel = dataArrayModel;
	
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
