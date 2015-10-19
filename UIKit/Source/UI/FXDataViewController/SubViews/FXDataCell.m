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

@synthesize contentImageView	= _contentImageView;
@synthesize stringLabel			= _stringLabel;
@synthesize spinnerView			= _spinnerView;

@synthesize model	= _model;

#pragma mark - 
#pragma mark Accessors

- (void)setModel:(FXDataModel *)model {
	FXSynthesizeObservableSetterAndLoad(model);
	
	[self fillWithModel:model];
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
	[self.spinnerView startAnimating];
}

- (void)modelDidLoad:(id)model {
	NSLog(@"modelDidLoad: %@", model);
	[self fillWithModel:model];
	[self.spinnerView stopAnimating];
	
}

- (void)modelDidFailLoading:(id)model {
	NSLog(@"modelDidFailLoading: %@", model);
}

@end
