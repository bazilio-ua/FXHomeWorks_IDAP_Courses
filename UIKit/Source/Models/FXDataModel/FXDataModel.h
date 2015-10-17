//
//  FXDataModel.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FXModel.h"

@interface FXDataModel : FXModel <NSCoding>
@property (nonatomic, strong, readonly)	UIImage		*image;
@property (nonatomic, copy)				NSString	*text;

@end
