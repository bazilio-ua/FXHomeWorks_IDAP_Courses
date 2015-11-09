//
//  FXFBFriendDetailViewController.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXFBFriendDetailViewController.h"
#import "FXFBFriendDetailView.h"

#import "FXFBUserContext.h"

#import "FXMacros.h"

FXViewControllerBaseViewProperty(FXFBFriendDetailViewController, friendDetailView, FXFBFriendDetailView);

@interface FXFBFriendDetailViewController ()

@end

@implementation FXFBFriendDetailViewController

#pragma mark -
#pragma mark Initializations and Deallocations

#pragma mark -
#pragma mark Accessors

- (Class)contextClass {
	return [FXFBUserContext class];
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.friendDetailView.model = self.model;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
}

@end
