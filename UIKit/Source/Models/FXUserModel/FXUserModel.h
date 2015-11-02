//
//  FXUserModel.h
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXModel.h"

@class FXUsersModel;
@class FXImageModel;

@interface FXUserModel : FXModel
@property (nonatomic, copy)		NSString		*userID;
@property (nonatomic, copy)		NSString		*firstName;
@property (nonatomic, copy)		NSString		*lastName;
@property (nonatomic, copy)		NSString		*imagePath;
@property (nonatomic, strong)	NSURL			*imageURL;
@property (nonatomic, strong)	FXImageModel	*imageModel;
@property (nonatomic, strong)	FXUsersModel	*friends;

@end
