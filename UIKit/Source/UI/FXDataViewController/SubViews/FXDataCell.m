//
//  FXDataCell.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/21/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXDataCell.h"

#import "FXDataModel.h"

@implementation FXDataCell

@synthesize imageView	= _image;
@synthesize stringLabel	= _string;

@synthesize model	= _model;

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
	self.imageView.image = model.image;
	self.stringLabel.text = model.text;
}

@end
