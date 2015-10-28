//
//  FXImageView.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/21/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXImageView.h"

#import "FXImageModel.h"

#import "FXMacros.h"

@implementation FXImageView

@synthesize imageView	= _imageView;
@synthesize imageModel	= _imageModel;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	self.imageModel = nil;
}

#pragma mark - 
#pragma mark Accessors

- (void)setImageModel:(FXImageModel *)imageModel {
	FXSynthesizeObservableSetter(imageModel);
	
	[self fillWithModel:imageModel];
	[imageModel load];
}

#pragma mark - 
#pragma mark Public Methods

- (void)fillWithModel:(FXImageModel *)model {
	self.imageView.image = model.image;
}

#pragma mark -
#pragma mark FXModelObserver protocol

- (void)modelWillLoad:(id)model {
	NSLog(@"modelWillLoad: %@", model);
	[self showLoadingView];
}

- (void)modelDidLoad:(id)model {
	NSLog(@"modelDidLoad: %@", model);
	[self fillWithModel:model];
	[self hideLoadingView];
}

- (void)modelDidFailLoading:(id)model {
	NSLog(@"modelDidFailLoading: %@", model);
	[self.imageModel load];
}

@end
