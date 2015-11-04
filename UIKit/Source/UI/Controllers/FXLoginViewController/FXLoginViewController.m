//
//  FXLoginViewController.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "FXLoginViewController.h"
#import "FXLoginView.h"

#import "FXLoginContext.h"
#import "FXUserModel.h"

#import "FXDispatch.h"

#import "FXMacros.h"

FXViewControllerBaseViewProperty(FXLoginViewController, loginView, FXLoginView);

@interface FXLoginViewController ()
@property (nonatomic, strong)	FXLoginContext	*loginContext;
@property (nonatomic, strong)	FXUserModel		*userModel;

- (void)makeLogOut;
- (void)pushFriendsViewController;

@end

@implementation FXLoginViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	self.loginContext = nil;
	self.userModel = nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		self.userModel = [FXUserModel new];
	}
	
	return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setLoginContext:(FXLoginContext *)loginContext {
	FXSynthesizeContextSetter(loginContext);
}

- (void)setUserModel:(FXUserModel *)userModel {
	FXSynthesizeObservableSetter(userModel);
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];
	
	if (self.userModel.userID) {
		[self pushFriendsViewController];
	}
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	self.loginView.userModel = self.userModel;
}

#pragma mark -
#pragma mark User Interactions

- (void)onLoginButton:(id)sender {
	if (!self.userModel.userID) {
		self.loginContext = [[FXLoginContext alloc] initWithModel:self.userModel];
	} else {
		[self makeLogOut];
	}
}

#pragma mark -
#pragma mark Public Methods

#pragma mark -
#pragma mark Private Methods

- (void)makeLogOut {
	FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
	FXUserModel *userModel = self.userModel;
	
	[loginManager logOut];
	userModel.userID = nil;
	userModel.state = kFXModelUnloaded;
}

- (void)pushFriendsViewController {
	
}

#pragma mark -
#pragma mark FXUserModelObserver protocol

- (void)modelDidChangeID:(FXUserModel *)model {
	if (model.userID) {
		FXDispatchAsyncOnMainQueueWithBlock(^{
			[self pushFriendsViewController];
		});
	}
}

@end
