//
//  FXURLImageModel.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/22/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXFileImageModel.h"

@interface FXURLImageModel : FXFileImageModel
@property (nonatomic, readonly, getter = isCached)	BOOL	cached;

@end
