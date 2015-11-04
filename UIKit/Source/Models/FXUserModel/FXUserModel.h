//
//  FXUserModel.h
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXModel.h"

typedef enum {
	kFXUserModelDidChangeID = kFXModelStateCount,
	kFXUserModelFriendsLoaded,
	kFXUserModelDetailLoaded
} FXUserModelState;

@class FXUsersModel;

@interface FXUserModel : FXModel
@property (nonatomic, copy)		NSString		*userID;
@property (nonatomic, copy)		NSString		*firstName;
@property (nonatomic, copy)		NSString		*lastName;
@property (nonatomic, strong)	NSURL			*imageURL;

@property (nonatomic, strong)	FXUsersModel	*friends;

@end
