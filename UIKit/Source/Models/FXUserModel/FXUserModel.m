//
//  FXUserModel.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXUserModel.h"
#import "FXImageModel.h"

#import "FXUserModelObserver.h"

@implementation FXUserModel

@dynamic imageModel;

#pragma mark -
#pragma mark Accessors

- (void)setUserID:(NSString *)userID {
	if (_userID != userID) {
		_userID = userID;
		
		self.state = kFXUserModelDidChangeID;
	}
}

- (FXImageModel *)imageModel {
	NSURL *imageURL = self.imageURL;
	return imageURL ? [FXImageModel imageWithURL:imageURL] : nil;
}

#pragma mark -
#pragma mark Overloaded Methods

- (SEL)selectorForState:(FXModelState)state {
	SEL selector = NULL;
	switch ((FXUserModelState)state) {
		case kFXUserModelDidChangeID:
			selector = @selector(modelDidChangeID:);
			break;
			
		default:
			selector = [super selectorForState:state];
			break;
	}
	
	return selector;
}

@end
