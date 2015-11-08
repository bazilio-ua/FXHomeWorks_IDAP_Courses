//
//  FXLoginView.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXLoginView.h"

#import "FXImageView.h"
#import "FXImageModel.h"
#import "FXUserModel.h"

#import "FXDispatch.h"

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
	self.model = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setModel:(FXUserModel *)model {
	FXSynthesizeObservableSetter(model);
	
	[self fillWithModel:model];
}

- (NSString *)loginButtonTitle {
	return self.model.userID ? kFXLogOutTitle : kFXLogInTitle;
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(FXUserModel *)model {
//	self.contentImageView.imageModel = model.imageModel;
	self.userIDLabel.text = model.userID;
	self.nameLabel.text = model.name;
	self.genderLabel.text = model.gender;
	self.emailLabel.text = model.email;
	self.locationLabel.text = model.location;
	
	[self.loginButton setTitle:self.loginButtonTitle forState:UIControlStateNormal];
}

#pragma mark -
#pragma mark Private Methods

#pragma mark -
#pragma mark FXUserModelObserver protocol

- (void)modelDidChangeID:(id)model {
	FXDispatchAsyncOnMainQueueWithBlock(^{
		[self fillWithModel:model];
	});
}

@end
