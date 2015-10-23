//
//  FXDataCell.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/21/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXDataCell.h"

#import "FXDataModel.h"

#import "FXMacros.h"

@implementation FXDataCell

@synthesize contentImageView		= _contentImageView;
@synthesize stringLabel				= _stringLabel;
@synthesize activityIndicatorView	= _activityIndicatorView;

@synthesize model	= _model;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	self.model = nil;
}

#pragma mark - 
#pragma mark Accessors

- (void)setModel:(FXDataModel *)model {
	FXSynthesizeObservableSetter(model);
	[self fillWithModel:model];
	[model load];
}

#pragma mark - 
#pragma mark Public Methods

- (void)fillWithModel:(FXDataModel *)model {
	self.contentImageView.image = model.image;
	self.stringLabel.text = model.text;
}

#pragma mark -
#pragma mark FXModelObserver protocol

- (void)modelWillLoad:(id)model {
	NSLog(@"modelWillLoad: %@", model);
	[self.activityIndicatorView startAnimating];
}

- (void)modelDidLoad:(id)model {
	NSLog(@"modelDidLoad: %@", model);
	[self fillWithModel:model];
	[self.activityIndicatorView stopAnimating];
	
}

- (void)modelDidFailLoading:(id)model {
	NSLog(@"modelDidFailLoading: %@", model);
}

@end
