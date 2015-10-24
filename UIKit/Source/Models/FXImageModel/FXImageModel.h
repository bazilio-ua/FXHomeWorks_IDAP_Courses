//
//  FXImageModel.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/18/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXModel.h"

@interface FXImageModel : FXModel
@property (nonatomic, strong, readonly)	UIImage	*image;
@property (nonatomic, strong, readonly)	NSURL	*url;

+ (id)imageWithURL:(NSURL *)url;

- (id)initWithURL:(NSURL *)url;

// should be invoked in subclasses when loading is complete
- (void)performLoadingWithCompletion:(void (^)(UIImage *image, id error))completion;
- (void)finalizeLoadingWithImage:(UIImage *)image error:(id)error;
- (void)notifyOfLoadingStateWithImage:(UIImage *)image error:(id)error;

@end
