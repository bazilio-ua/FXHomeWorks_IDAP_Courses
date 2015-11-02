//
//  FXLoginContext.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "FXLoginContext.h"

@implementation FXLoginContext

#pragma mark -
#pragma mark Public Methods

- (void)execute {
	FBSDKLoginManager *loginManager = [FBSDKLoginManager new];
	[loginManager logInWithReadPermissions:@[@"public_profile", @"email", @"user_friends"]
								   handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
									   if (error) {
										   NSLog(@"Login Error");
									   } else if (result.isCancelled) {
										   NSLog(@"Login Canceled");
									   } else {
										   if ([result.grantedPermissions containsObject:@"email"]) {
											   NSLog(@"Login OK");
										   }
									   }
								   }];
}

@end
