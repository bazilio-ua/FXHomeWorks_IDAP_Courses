//
//  FXUserModel.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXUserModel.h"

#import "FXImageModel.h"

@implementation FXUserModel

@dynamic imageModel;

#pragma mark -
#pragma mark Accessors

- (FXImageModel *)imageModel {
	return [FXImageModel imageWithURL:[NSURL URLWithString:self.imagePath]];
}

@end
