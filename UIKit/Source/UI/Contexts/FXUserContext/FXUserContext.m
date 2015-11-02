//
//  FXUserContext.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "FXUserContext.h"

#import "FXUserModel.h"

static CGSize	kFXUserImageSize = {96, 96};

@implementation FXUserContext

#pragma mark -
#pragma mark Class Methods

+ (FXUserModel *)userModelWithModel:(FXUserModel *)model {
	FBSDKAccessToken *accessToken = [FBSDKAccessToken currentAccessToken];
	if (accessToken) {
		FBSDKProfile *profile = [FBSDKProfile currentProfile];
		model.userID = accessToken.userID;
		model.firstName = profile.firstName;
		model.lastName = profile.lastName;
		model.imagePath = [profile imagePathForPictureMode:FBSDKProfilePictureModeSquare
													  size:kFXUserImageSize];
		FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me/friendlists"
																	   parameters:nil
																	   HTTPMethod:@"GET"];
		[request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
			if (!error) {
				NSLog(@"request result = %@", result);
			}
		}];
	}
	
	if ([FBSDKAccessToken currentAccessToken]) {
		[[[FBSDKGraphRequest alloc] initWithGraphPath:@"me"
										   parameters:nil]
		 startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
			 if (!error) {
				 NSLog(@"fetched user: %@", result);
			 }
		 }];
	}
	
	return model;
}

@end
