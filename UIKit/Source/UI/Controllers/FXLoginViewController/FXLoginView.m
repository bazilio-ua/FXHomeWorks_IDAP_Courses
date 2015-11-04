//
//  FXLoginView.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXLoginView.h"

#import "FXUserModel.h"

#import "FXMacros.h"

static NSString * const kFXLogInTitle	= @"LogIn";
static NSString * const kFXLogOutTitle	= @"LogOut";

@interface FXLoginView ()
@property (nonatomic, readonly)	NSString	*loginButtonTitle;

@end

@implementation FXLoginView

@dynamic loginButtonTitle;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	self.userModel = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setUserModel:(FXUserModel *)userModel {
	FXSynthesizeObservableSetter(userModel);
	[self fillWithModel:userModel];
}

- (NSString *)loginButtonTitle {
	return self.userModel.userID ? kFXLogOutTitle : kFXLogInTitle;
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(FXUserModel *)model {
	[self.loginButton setTitle:self.loginButtonTitle forState:UIControlStateNormal];
	self.userIDLabel.text = model.userID;
}

#pragma mark -
#pragma mark Private Methods

#pragma mark -
#pragma mark FXUserModelObserver protocol

- (void)modelDidChangeID:(id)model {
	[self fillWithModel:model];
}

@end
