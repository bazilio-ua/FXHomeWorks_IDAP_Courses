//
//  FXModel.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/8/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXObservableObject.h"

typedef enum {
	kFXModelUnloaded,
	kFXModelWillLoad,
	kFXModelLoaded,
	kFXModelFailedLoading,
	kFXModelDidChange,
	kFXModelStateCount
} FXModelState;

@interface FXModel : FXObservableObject
@property (nonatomic, assign)	NSUInteger	state;

- (void)setState:(NSUInteger)state withChanges:(id)changes;

- (SEL)selectorForState:(NSUInteger)state;

- (void)load;
- (void)setupLoading;
- (void)performLoading;

- (void)performBlock:(void (^)(void))block shouldNotify:(BOOL)shouldNotify;

@end
