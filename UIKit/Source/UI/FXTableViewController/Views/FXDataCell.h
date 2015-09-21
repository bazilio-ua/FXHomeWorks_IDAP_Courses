//
//  FXDataCell.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/21/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXTableViewCell.h"

@class FXDataModel;

@interface FXDataCell : FXTableViewCell
@property (nonatomic, strong)	IBOutlet	UIImageView	*imageView;
@property (nonatomic, strong)	IBOutlet	UILabel		*stringLabel;

@property (nonatomic, strong)	FXDataModel				*dataModel;

- (void)fillWithModel:(FXDataModel *)model;

@end
