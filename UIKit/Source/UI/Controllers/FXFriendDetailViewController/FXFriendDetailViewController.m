//
//  FXFriendDetailViewController.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXFriendDetailViewController.h"
#import "FXFriendDetailView.h"

#import "FXUserContext.h"

#import "FXMacros.h"

FXViewControllerBaseViewProperty(FXFriendDetailViewController, friendDetailView, FXFriendDetailView);

@interface FXFriendDetailViewController ()

@end

@implementation FXFriendDetailViewController

#pragma mark -
#pragma mark Initializations and Deallocations

#pragma mark -
#pragma mark Accessors

- (Class)contextClass {
	return [FXUserContext class];
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.friendDetailView.model = self.model;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
//	self.friendDetailView.model = self.model;
}

@end
