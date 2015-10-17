//
//  FXDataCell.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/21/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXTableViewCell.h"

#import "FXModelObserver.h"

@class FXDataModel;

@interface FXDataCell : FXTableViewCell <FXModelObserver>
@property (nonatomic, strong)	IBOutlet	UIImageView				*imageView;
@property (nonatomic, strong)	IBOutlet	UILabel					*stringLabel;
@property (nonatomic, strong)	IBOutlet	UIActivityIndicatorView	*spinnerView;

@property (nonatomic, strong)	FXDataModel				*model;

- (void)fillWithModel:(FXDataModel *)model;

@end
