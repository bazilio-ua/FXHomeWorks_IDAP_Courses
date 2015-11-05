//
//  FXFriendDetailView.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXFriendDetailView.h"

#import "FXImageView.h"
#import "FXImageModel.h"
#import "FXUserModel.h"

#import "FXDispatch.h"

#import "FXMacros.h"

@implementation FXFriendDetailView

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

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(FXUserModel *)model {
	self.contentImageView.imageModel = model.imageModel;
	self.nameLabel.text = model.name;
}

#pragma mark -
#pragma mark FXUserModelObserver protocol

- (void)modelDetailDidLoad:(id)model {
	FXDispatchAsyncOnMainQueueWithBlock(^{
		[self fillWithModel:model];
	});
}

@end




