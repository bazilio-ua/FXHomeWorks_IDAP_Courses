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
static NSString * const kFXDefaultDataImageName = @"objc";

static NSString * const kFXDefaultDataKeyName = @"text";

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
		__image = [UIImage imageNamed:kFXDefaultDataImageName];
	});
	
	return __image;
}

#pragma mark -
#pragma mark NSCoding protocol

- (id)initWithCoder:(NSCoder *)decoder {
	self = [super init];
	if (self) {
		self.text = [decoder decodeObjectForKey:kFXDefaultDataKeyName];
	}
	
	return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.text forKey:kFXDefaultDataKeyName];
}

@end
