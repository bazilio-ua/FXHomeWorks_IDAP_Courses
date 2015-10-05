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

@synthesize text = _text;

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)init {
	self = [super init];
	if (self) {
		self.text = [NSString randomStringWithLength:kFXDefaultDataStringLength];
	}
	
	return self;
}

#pragma mark -
#pragma mark Accessors

- (UIImage *)image {
	static UIImage *__image = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		// use cache
		__image = [UIImage imageNamed:@"objc"];
	});
	
	return __image;
}

@end
