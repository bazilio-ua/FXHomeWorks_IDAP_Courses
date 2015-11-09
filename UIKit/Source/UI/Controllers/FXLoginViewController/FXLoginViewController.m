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
#import "FXFriendDetailViewController.h"

#import "FXLoginContext.h"
//#import "FXUserContext.h"

#import "FXUserModel.h"
#import "FXUsersModel.h"

#import "FXDispatch.h"

#import "UIViewController+FXExtensions.h"

#import "FXMacros.h"

FXViewControllerBaseViewProperty(FXLoginViewController, loginView, FXLoginView);

@interface FXLoginViewController ()

- (void)setupNavigationItem;
- (void)updateNavigationItem;
- (void)pushFriendsViewController;
- (void)pushFriendDetailViewController;
- (void)makeLogOut;

@end

@implementation FXLoginViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		self.model = [FXUserModel new];
		[self setupNavigationItem];
		[self updateNavigationItem];
	}
	
	return self;
}

#pragma mark -
#pragma mark Accessors

- (Class)contextClass {
	return [FXContext class];
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.loginView.model = self.model;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
}

#pragma mark -
#pragma mark User Interactions

- (void)onLoginButton:(id)sender {
	if (self.model.userID) {
		[self makeLogOut];
	} else {
		self.context = [FXLoginContext contextWithModel:self.model];
	}
}

#pragma mark -
#pragma mark Public Methods

#pragma mark -
#pragma mark Private Methods

- (void)setupNavigationItem {
	UINavigationItem *item = self.navigationItem;
	item.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Friends"
															   style:UIBarButtonItemStylePlain
															  target:self
															  action:@selector(pushFriendsViewController)];
	
	item.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Profile"
															  style:UIBarButtonItemStylePlain
															 target:self
															 action:@selector(pushFriendDetailViewController)];
}

- (void)updateNavigationItem {
	UINavigationItem *item = self.navigationItem;
	BOOL active = (self.model.userID) ? YES : NO;
	
	[item.rightBarButtonItem setEnabled:active];
	[item.leftBarButtonItem setEnabled:active];
}

- (void)pushFriendsViewController {
	if (self.model.userID) {
		FXFriendsViewController *controller = [FXFriendsViewController controller];
//		controller.model = [FXUserModel new];
		controller.model = self.model;
		
		[self.navigationController pushViewController:controller animated:YES];
	}
}

- (void)pushFriendDetailViewController {
//	self.model.state = kFXModelUnloaded;
//	self.context = [FXUserContext contextWithModel:self.model];
	
	if (self.model.userID) {
		FXFriendDetailViewController *controller = [FXFriendDetailViewController controller];
//		controller.model = [FXUserModel new];
		controller.model = self.model;
		
		[self.navigationController pushViewController:controller animated:YES];
	}
}

- (void)makeLogOut {
	FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
	FXUserModel *model = self.model;
	
	[loginManager logOut];
	model.userID = nil;
	model.state = kFXModelUnloaded;
}

#pragma mark -
#pragma mark FXUserModelObserver protocol

- (void)modelDidChangeID:(FXUserModel *)model {
	FXDispatchAsyncOnMainQueueWithBlock(^{
		[self updateNavigationItem];
		
//		if (model.userID) {
//			[self pushFriendsViewController];
//			[self pushFriendDetailViewController];
//		}
	});
}

@end
