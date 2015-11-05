//
//  FXFriendsViewController.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXFriendsViewController.h"
#import "FXFriendsView.h"

#import "FXUserContext.h"
#import "FXUserModel.h"
#import "FXUsersContext.h"
#import "FXUsersModel.h"

#import "FXFriendCell.h"

#import "UINib+FXExtensions.h"
#import "UITableView+FXExtensions.h"
#import "NSIndexPath+FXExtensions.h"

#import "FXMacros.h"

FXViewControllerBaseViewProperty(FXFriendsViewController, friendsView, FXFriendsView);

@interface FXFriendsViewController ()
@property (nonatomic, readonly)	FXUsersModel	*friends;

@end

@implementation FXFriendsViewController

@dynamic friends;

#pragma mark -
#pragma mark Initializations and Deallocations

#pragma mark -
#pragma mark Accessors

- (Class)contextClass {
	return [FXUsersContext class];
}

- (FXUsersModel *)friends {
	return self.model.friends;
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.friendsView.model = self.model;
}

#pragma mark -
#pragma mark UITableViewDataSource protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.friends count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	FXFriendCell *cell = [tableView dequeueReusableCellWithClass:[FXFriendCell class]];
	cell.model = self.friends[indexPath.row];
	
	return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate protocol

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
}

@end
