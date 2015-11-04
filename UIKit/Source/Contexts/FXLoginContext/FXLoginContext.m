//
//  FXLoginContext.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "FXLoginContext.h"

#import "FXUserModel.h"

#import "FXContextsRequestConstants.h"

@interface FXLoginContext ()
@property (nonatomic, strong)	FXUserModel	*model;
@property (nonatomic, readonly)	NSArray		*permissions;

- (void)makeLogIn;
- (void)finalizeLogIn;

@end

@implementation FXLoginContext

@dynamic permissions;

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)initWithModel:(FXUserModel *)model {
	self = [super init];
	if (self) {
		self.model = model;
	}
	
	return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)permissions {
	return @[kFXPublicProfile, kFXEmail, kFXUserFriends];
}

#pragma mark -
#pragma mark Overriden Public Methods

- (void)execute {
	FBSDKAccessToken *token = [FBSDKAccessToken currentAccessToken];
	if (!token.userID) {
		[self makeLogIn];
	} else {
		[self finalizeLogIn];
	}
}

- (void)cancel {
	
}

#pragma mark -
#pragma mark Private Methods

- (void)makeLogIn {
	FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
	
	id handler = ^(FBSDKLoginManagerLoginResult *result, NSError *error) {
		if (error) {
			NSLog(@"Login Error");
		} else if (result.isCancelled) {
			NSLog(@"Login Cancelled");
		} else {
			NSLog(@"Logged in");
			[self finalizeLogIn];
		}
	};
	
	[loginManager logInWithReadPermissions:self.permissions handler:handler];
}

- (void)finalizeLogIn {
	FBSDKAccessToken *token = [FBSDKAccessToken currentAccessToken];
	if (token) {
		self.model.userID = token.userID;
	}
}

@end
