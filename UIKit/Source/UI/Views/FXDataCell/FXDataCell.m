//
//  FXDataCell.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/21/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXDataCell.h"

#import "FXImageView.h"
#import "FXDataModel.h"

@implementation FXDataCell

@synthesize modelImageView			= _modelImageView;
@synthesize stringLabel				= _stringLabel;

@synthesize model	= _model;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	self.model = nil;
}

#pragma mark - 
#pragma mark Accessors

- (void)setModel:(FXDataModel *)model {
	if (_model != model) {
		_model = model;
	}
	
	[self fillWithModel:model];
}

#pragma mark - 
#pragma mark Public Methods

- (void)fillWithModel:(FXDataModel *)model {
	self.modelImageView.imageModel = model.imageModel;
	self.stringLabel.text = model.text;
}

@end
