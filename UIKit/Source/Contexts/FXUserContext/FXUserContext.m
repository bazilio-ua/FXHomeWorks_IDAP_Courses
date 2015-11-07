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

#import "FXContextsRequestConstants.h"

@implementation FXUserContext

#pragma mark -
#pragma mark Overriden Public Methods

- (NSString *)graphPath {
	return @"me";
}

- (NSDictionary *)graphPathParameters {
	return @{@"fields":@"name,email,picture{url}"};
}

- (void)parseWithResult:(id)result error:(NSError *)error {
	FXUserModel *model = self.model;
	model.name = result[kFXName];
	model.email = result[kFXEmail];
	model.imageURL = [NSURL URLWithString:result[kFXPicture][kFXData][kFXURL]];
	model.state = kFXModelLoaded;
}

@end
