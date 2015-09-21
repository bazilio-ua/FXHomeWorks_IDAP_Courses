//
//  FXDataModel.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXDataModel.h"

#import "NSString+FXExtensions.h"

static const NSUInteger kFXDefaultDataStringLength = 10;

@implementation FXDataModel

@dynamic image;
@dynamic text;

#pragma mark -
#pragma mark Accessors

- (UIImage *)image {
	return [UIImage imageNamed:@"objc.png"];
}

- (NSString *)text {
	return [NSString randomStringWithLength:kFXDefaultDataStringLength];
}

@end
