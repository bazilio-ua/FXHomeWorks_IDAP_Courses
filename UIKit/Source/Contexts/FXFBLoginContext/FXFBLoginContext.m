//
//  FXFBLoginContext.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "FXFBLoginContext.h"

#import "FXUserModel.h"

#import "FXFBContextsRequestConstants.h"

@interface FXFBLoginContext ()
@property (nonatomic, readonly)	NSArray		*permissions;

- (void)performLogInToFacebook;

@end

@implementation FXFBLoginContext

@dynamic permissions;

#pragma mark -
#pragma mark Accessors

- (NSArray *)permissions {
	return @[kFXPublicProfile, kFXEmail, kFXUserFriends];
}

#pragma mark -
#pragma mark Overriden Public Methods

- (void)execute {
	FBSDKAccessToken *token = [FBSDKAccessToken currentAccessToken];
	if (token.userID) {
		[self parseWithResult:nil error:nil];
	} else {
		[self performLogInToFacebook];
	}
}

- (void)cancel {
	
}

- (void)parseWithResult:(id)result error:(NSError *)error {
	FBSDKAccessToken *token = [FBSDKAccessToken currentAccessToken];
	if (token) {
		self.model.userID = token.userID;
	}
}

#pragma mark -
#pragma mark Private Methods

- (void)performLogInToFacebook {
	FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
	
	id handler = ^(FBSDKLoginManagerLoginResult *result, NSError *error) {
		if (result.isCancelled) {
			NSLog(@"Login is Cancelled");
		} else {
			NSLog(@"Login Result: %@", result);
			[self parseWithResult:result error:error];
		}
	};
	
	[loginManager logInWithReadPermissions:self.permissions handler:handler];
}

@end
