//
//  FXDataModel.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXDataModel.h"

#import "NSString+FXExtensions.h"

#import "FXDispatch.h"
#import "FXMacros.h"

static NSString * const kFXDefaultDataImageName		= @"objc";
static NSString * const kFXDefaultDataName			= @"text";
static const NSUInteger kFXDefaultDataStringLength	= 10;
static const NSUInteger kFXDefaultSleepTimeInterval	= 5;

@interface FXDataModel ()
@property (nonatomic, strong)	UIImage		*image;

@end

@implementation FXDataModel

@synthesize image	= _image;
@synthesize text	= _text;

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

#pragma mark -
#pragma mark Overriden Public Methods

- (void)performLoading {
	FXSleep(kFXDefaultSleepTimeInterval);
	self.image = [UIImage imageNamed:kFXDefaultDataImageName];
	
	FXDispatchAsyncOnMainQueueWithBlock(^{
		void(^block)(void) = ^{
			self.state = kFXModelLoaded;
		};
		
		[self performBlock:block shouldNotify:YES];
	});
}

#pragma mark -
#pragma mark NSCoding protocol

- (id)initWithCoder:(NSCoder *)decoder {
	self = [super init];
	if (self) {
		self.text = [decoder decodeObjectForKey:kFXDefaultDataName];
	}
	
	return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.text forKey:kFXDefaultDataName];
}

@end
