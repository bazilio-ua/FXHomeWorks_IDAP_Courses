//
//  FXModel.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/8/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXObservableObject.h"

typedef enum {
	kFXArrayModelUnloaded,
	kFXArrayModelLoading,
	kFXArrayModelLoaded,
	kFXArrayModelFailedLoading,
	kFXModelDidChange
} FXModelState;

@interface FXModel : FXObservableObject

- (SEL)selectorForState:(FXModelState)state;

@end
