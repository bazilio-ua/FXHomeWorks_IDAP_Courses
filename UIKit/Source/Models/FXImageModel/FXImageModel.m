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

@interface FXImageModel ()
@property (nonatomic, strong)	UIImage	*image;
@property (nonatomic, strong)	NSURL	*url;

@end

@implementation FXImageModel

@synthesize image	= _image;
@synthesize url		= _url;

#pragma mark -
#pragma mark Class Methods

+ (id)imageWithURL:(NSURL *)url {
	Class class = ([url isFileURL]) ? [FXFileImageModel class] : [FXURLImageModel class];
	
	return [[class alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	[[FXCache cache] removeObjectForKey:self.url];
}

- (id)initWithURL:(NSURL *)url {
	@synchronized(self) {
		FXCache *cache = [FXCache cache];
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
#pragma mark Public Methods

- (void)performLoading {
	FXWeakify(self);
	[self performLoadingWithCompletion:^(UIImage *image, id error) {
		FXStrongifyAndReturnIfNil(self);
		[self finalizeLoadingWithImage:image error:error];
		[self notifyOfLoadingStateWithImage:image error:error];
	}];
}

- (void)performLoadingWithCompletion:(void (^)(UIImage *, id))completion {
	
}

- (void)finalizeLoadingWithImage:(UIImage *)image error:(id)error {
	self.image = image;
}

- (void)notifyOfLoadingStateWithImage:(UIImage *)image error:(id)error {
	FXWeakify(self);
	FXDispatchAsyncOnMainQueueWithBlock(^{
		FXStrongifyAndReturnIfNil(self);
		((FXModel *)self).state = image ? kFXModelLoaded : kFXModelFailedLoading;
	});
}

@end
