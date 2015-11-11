//
//  FXUserModel.h
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXModel.h"

typedef enum {
	kFXUserModelDidChangeID = kFXModelStateCount
} FXUserModelState;

@class FXImageModel;
@class FXUsersModel;

@interface FXUserModel : FXModel
@property (nonatomic, copy)		NSString		*userID;
@property (nonatomic, copy)		NSString		*name;
@property (nonatomic, copy)		NSString		*gender;
@property (nonatomic, copy)		NSString		*email;
@property (nonatomic, copy)		NSString		*location;

@property (nonatomic, copy)		NSURL			*imageURL;
@property (nonatomic, readonly)	FXImageModel	*imageModel;

@property (nonatomic, strong)	FXUsersModel	*friends;

@end
