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
#import "FXFriendsViewController.h"

#import "FXLoadingLoginContext.h"
#import "FXLoginContext.h"

#import "FXUserModel.h"
#import "FXUsersModel.h"

#import "FXDispatch.h"

#import "UIViewController+FXExtensions.h"

#import "FXMacros.h"

FXViewControllerBaseViewProperty(FXLoginViewController, loginView, FXLoginView);

@interface FXLoginViewController ()
@property (nonatomic, strong)	FXLoginContext	*loginContext;

- (void)makeLogOut;
- (void)pushFriendsViewController;

@end

@implementation FXLoginViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		self.model = [FXUserModel new];
	}
	
	return self;
}

#pragma mark -
#pragma mark Accessors

- (Class)contextClass {
	return [FXLoadingLoginContext class];
}

- (void)setLoginContext:(FXLoginContext *)loginContext {
	FXSynthesizeContextSetter(loginContext);
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];
	
	if (self.model.userID) {
		[self pushFriendsViewController];
	}
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	self.loginView.model = self.model;
}

#pragma mark -
#pragma mark User Interactions

- (void)onLoginButton:(id)sender {
	if (!self.model.userID) {
		self.loginContext = [FXLoginContext contextWithModel:self.model];
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
	FXUserModel *model = self.model;
	
	[loginManager logOut];
	model.userID = nil;
	model.state = kFXModelUnloaded;
}

- (void)pushFriendsViewController {
	FXFriendsViewController *controller = [FXFriendsViewController controller];
	controller.model = [FXUserModel new];
	controller.model.friends = [FXUsersModel new];
	
	[self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark FXUserModelObserver protocol

- (void)modelIDDidLoad:(FXUserModel *)model {
	if (model.userID) {
//		FXDispatchAsyncOnMainQueueWithBlock(^{
			[self pushFriendsViewController];
//		});
	}
}

@end
