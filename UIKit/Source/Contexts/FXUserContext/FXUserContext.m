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
	return kFXMe;
}

- (NSDictionary *)graphPathParameters {
	return nil;
}

@end
