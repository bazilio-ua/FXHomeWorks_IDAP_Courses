//
//  FXUserContext.h
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXContext.h"

@class FXUserModel;

@interface FXUserContext : FXContext

+ (FXUserModel *)userModelWithModel:(FXUserModel *)model;

@end
