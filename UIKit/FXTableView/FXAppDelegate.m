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

@implementation FXAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//	UIWindow *window = [UIWindow window];
	self.window = window;
	
    // Override point for customization after application launch.
	FXTableViewController *controller = [[FXTableViewController alloc] initWithNibName:@"FXTableViewController" bundle:nil];
//	FXTableViewController *controller = [FXTableViewController controller];
	
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
