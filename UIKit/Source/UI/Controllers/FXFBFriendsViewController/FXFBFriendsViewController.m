//
//  FXFBFriendsViewController.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXFBFriendsViewController.h"
#import "FXFBFriendsView.h"
#import "FXFBFriendDetailViewController.h"

#import "FXUserModel.h"
#import "FXFBUsersContext.h"
#import "FXUsersModel.h"

#import "FXFBFriendCell.h"

#import "FXDispatch.h"

#import "UINib+FXExtensions.h"
#import "UITableView+FXExtensions.h"
#import "NSIndexPath+FXExtensions.h"
#import "UIViewController+FXExtensions.h"

#import "FXMacros.h"

FXViewControllerBaseViewProperty(FXFBFriendsViewController, friendsView, FXFBFriendsView);

@interface FXFBFriendsViewController ()
@property (nonatomic, readonly)	FXUsersModel	*friends;

- (void)pushFriendDetailViewControllerWithModel:(FXUserModel *)model;

@end

@implementation FXFBFriendsViewController

@dynamic friends;

#pragma mark -
#pragma mark Initializations and Deallocations

#pragma mark -
#pragma mark Accessors

- (Class)contextClass {
	return [FXFBUsersContext class];
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

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
}

#pragma mark -
#pragma mark UITableViewDataSource protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.friends count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	FXFBFriendCell *cell = [tableView dequeueReusableCellWithClass:[FXFBFriendCell class]];
	cell.model = self.friends[indexPath.row];
	
	return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate protocol

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	FXUserModel *model = self.friends[indexPath.row];
	
	[self pushFriendDetailViewControllerWithModel:model];
}

#pragma mark -
#pragma mark Private Methods

- (void)pushFriendDetailViewControllerWithModel:(FXUserModel *)model {
	if (model.userID) {
		FXFBFriendDetailViewController *controller = [FXFBFriendDetailViewController controller];
		controller.model = model;
		
		[self.navigationController pushViewController:controller animated:YES];
	}
}

#pragma mark -
#pragma mark FXUserModelObserver protocol

- (void)modelDidLoad:(id)model {
	FXDispatchAsyncOnMainQueueWithBlock(^{
		[self.friendsView.tableView reloadData];
		[self.friendsView hideLoadingView];
	});
}

- (void)modelWillLoad:(id)model {
	FXDispatchAsyncOnMainQueueWithBlock(^{
		[self.friendsView showLoadingView];
	});
}

@end
