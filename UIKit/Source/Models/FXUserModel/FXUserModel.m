//
//  FXUserModel.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXUserModel.h"

#import "FXUserModelObserver.h"

@implementation FXUserModel

#pragma mark -
#pragma mark Accessors

- (void)setUserID:(NSString *)userID {
	if (_userID != userID) {
		_userID = userID;
		
		self.state = kFXUserModelIDLoaded;
	}
}

#pragma mark -
#pragma mark Overloaded Methods

- (SEL)selectorForState:(FXModelState)state {
	SEL selector = NULL;
	switch ((FXUserModelState)state) {
		case kFXUserModelIDLoaded:
			selector = @selector(modelIDDidLoad:);
			break;
		
		case kFXUserModelFriendsLoaded:
			selector = @selector(modelFriendsDidLoad:);
			break;
			
		case kFXUserModelDetailLoaded:
			selector = @selector(modelDetailDidLoad:);
			break;
			
		default:
			selector = [super selectorForState:state];
			break;
	}
	
	return selector;
}

@end
