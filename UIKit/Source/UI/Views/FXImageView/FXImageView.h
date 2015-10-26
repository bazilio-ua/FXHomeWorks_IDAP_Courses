//
//  FXImageView.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/21/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXView.h"

#import "FXModelObserver.h"

@class FXImageModel;

@interface FXImageView : FXView <FXModelObserver>
@property (nonatomic, strong)	IBOutlet	UIImageView		*imageView;
@property (nonatomic, strong)				FXImageModel	*imageModel;

- (void)fillWithModel:(id)model;

@end
