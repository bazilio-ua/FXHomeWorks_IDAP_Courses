//
//  FXLoadingLoginContext.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/4/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "FXLoadingLoginContext.h"

#import "FXUserModel.h"

@implementation FXLoadingLoginContext

#pragma mark -
#pragma mark Overriden Public Methods

- (void)execute {
	[self parseWithResult:nil error:nil];
}

- (void)parseWithResult:(id)result error:(NSError *)error {
	FBSDKAccessToken *token = [FBSDKAccessToken currentAccessToken];
	if (token) {
		self.model.userID = token.userID;
	}
}

@end
