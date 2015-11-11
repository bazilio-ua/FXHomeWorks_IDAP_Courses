//
//  FXAppDelegate.m
//  FXUsers
//
//  Created by Basil Nikityuk on 10/31/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "FXAppDelegate.h"

#import "FXFBLoginViewController.h"

#import "UIWindow+FXExtensions.h"
#import "UIViewController+FXExtensions.h"
#import "UINavigationController+FXExtensions.h"

@implementation FXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	UIWindow *window = [UIWindow window];
    self.window = window;
    
    // Override point for customization after application launch.
	FXFBLoginViewController *controller = [FXFBLoginViewController controller];
	UINavigationController *navigationController = [UINavigationController navigationControllerWithRootViewController:controller];
	
	window.rootViewController = navigationController;
    [window makeKeyAndVisible];
	
    return [[FBSDKApplicationDelegate sharedInstance] application:application
									didFinishLaunchingWithOptions:launchOptions];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBSDKAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
	return [[FBSDKApplicationDelegate sharedInstance] application:application
														  openURL:url
												sourceApplication:sourceApplication
													   annotation:annotation];
}

@end
