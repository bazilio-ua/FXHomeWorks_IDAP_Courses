//
//  FXFileImageModel.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/22/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXImageModel.h"

@interface FXFileImageModel : FXImageModel
@property (nonatomic, readonly)	NSString	*fileName;
@property (nonatomic, readonly)	NSString	*fileFolder;
@property (nonatomic, readonly)	NSString	*filePath;

@property (nonatomic, readonly, getter = isCached)	BOOL	cached;

@end
