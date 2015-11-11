//
//  FXFBUserContext.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "FXFBUserContext.h"

#import "FXUserModel.h"

#import "FXFBContextsRequestConstants.h"

@implementation FXFBUserContext

#pragma mark -
#pragma mark Overriden Public Methods

- (NSString *)graphPath {
	return self.model.userID;
}

- (NSDictionary *)graphPathParameters {
	return @{@"fields":@"name,email,gender,location,picture{url}"};
}

- (void)parseWithResult:(id)result error:(NSError *)error {
	FXUserModel *model = self.model;
	model.name = result[kFXName];
	model.gender = result[kFXGender];
	model.email = result[kFXEmail];
	model.location = result[kFXLocation][kFXName];
	model.imageURL = [NSURL URLWithString:result[kFXPicture][kFXData][kFXURL]];
	model.state = kFXModelLoaded;
}

@end