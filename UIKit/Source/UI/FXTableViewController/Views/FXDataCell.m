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

@synthesize dataModel	= _dataModel;

#pragma mark - 
#pragma mark Accessors

- (void)setDataModel:(FXDataModel *)dataModel {
	if (_dataModel != dataModel) {
		_dataModel = dataModel;
	}
	
	[self fillWithModel:dataModel];
}

#pragma mark - 
#pragma mark Public Methods

- (void)fillWithModel:(FXDataModel *)model {
	self.imageView.image = model.image;
	self.stringLabel.text = model.text;
}

@end
