//
//  FXUsersContext.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXUsersContext.h"

#import "FXUserModel.h"
#import "FXUsersModel.h"

#import "FXContextsRequestConstants.h"

@implementation FXUsersContext

#pragma mark -
#pragma mark Overriden Public Methods

- (NSString *)graphPath {
	return @"me";
}

- (NSDictionary *)graphPathParameters {
	return @{@"fields":@"friends{id,name,picture{url}}",};
}

- (void)parseWithResult:(id)result error:(NSError *)error {
	FXUsersModel *modelFriends = self.model.friends;
	NSArray *friends = result[kFXFriends][kFXData];
	
	id block = ^{
		for (id friend in friends) {
			FXUserModel *model = [FXUserModel new];
			model.userID = friend[kFXID];
			model.name = friend[kFXName];
			model.imageURL = [NSURL URLWithString:friend[kFXPicture][kFXData][kFXURL]];
			[modelFriends addObject:model];
		}
	};
	
	[modelFriends performBlock:block shouldNotify:NO];
	modelFriends.state = kFXUserModelFriendsLoaded;
}

@end
