//
//  FXImageModel.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/18/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXImageModel.h"

#import "FXFileImageModel.h"
#import "FXURLImageModel.h"
#import "FXCache.h"

#import "FXDispatch.h"

#import "FXMacros.h"

static const NSUInteger kFXDefaultSleepTimeInterval	= 1;

@interface FXImageModel ()
@property (nonatomic, strong)	UIImage	*image;
@property (nonatomic, strong)	NSURL	*url;
@property (nonatomic, readonly)	FXCache	*cache;

+ (FXCache *)cache;

@end

@implementation FXImageModel

@synthesize image	= _image;
@synthesize url		= _url;

@dynamic cache;

#pragma mark -
#pragma mark Class Methods

+ (FXCache *)cache {
	return [FXCache cache];
}

+ (id)imageWithURL:(NSURL *)url {
	Class aClass = ([url isFileURL]) ? [FXFileImageModel class] : [FXURLImageModel class];
	
	return [[aClass alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	[self.cache removeObjectForKey:self.url];
}

- (id)initWithURL:(NSURL *)url {
	FXCache *cache = self.cache;
	@synchronized(cache) {
		id image = [cache objectForKey:url];
		if (image) {
			return image;
		}
		
		self = [super init];
		if (self) {
			self.url = url;
			[cache addObject:self forKey:url];
		}
		
		return self;
	}
}

#pragma mark -
#pragma mark Accessors

- (FXCache *)cache {
	return [[self class] cache];
}

#pragma mark -
#pragma mark Overriden Public Methods

- (void)performLoading {
	FXWeakify(self);
	[self performLoadingWithCompletion:^(UIImage *image, id error) {
		FXStrongifyAndReturnIfNil(self);
		
		FXSleep(kFXDefaultSleepTimeInterval);
		[self finalizeLoadingWithImage:image error:error];
		[self notifyOfLoadingStateWithImage:image error:error];
	}];
}

#pragma mark -
#pragma mark Public Methods

- (void)performLoadingWithCompletion:(void (^)(UIImage *image, id error))completion {
	
}

- (void)finalizeLoadingWithImage:(UIImage *)image error:(id)error {
	self.image = image;
	if (error) {
		NSLog(@"%@", [error localizedDescription]);
	}
}

- (void)notifyOfLoadingStateWithImage:(UIImage *)image error:(id)error {
	FXDispatchAsyncOnMainQueueWithBlock(^{
		self.state = image ? kFXModelLoaded : kFXModelFailedLoading;
	});
}

@end
