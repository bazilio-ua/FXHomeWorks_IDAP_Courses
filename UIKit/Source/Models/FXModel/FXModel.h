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
@property (nonatomic, assign)	FXModelState	state;

- (void)setState:(FXModelState)state withChanges:(id)changes;

- (SEL)selectorForState:(FXModelState)state;

@end
