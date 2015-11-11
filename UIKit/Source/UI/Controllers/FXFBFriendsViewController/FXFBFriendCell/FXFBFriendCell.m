//
//  FXFBFriendCell.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/5/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXFBFriendCell.h"

#import "FXImageView.h"
#import "FXUserModel.h"

@implementation FXFBFriendCell

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	self.model = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setModel:(FXUserModel *)model {
	if (_model != model) {
		_model = model;
	}
	
	[self fillWithModel:model];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(FXUserModel *)model {
	self.contentImageView.imageModel = model.imageModel;
	self.nameLabel.text = model.name;
}

@end
