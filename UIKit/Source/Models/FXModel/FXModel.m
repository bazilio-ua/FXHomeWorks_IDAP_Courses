//
//  FXModel.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/8/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXModel.h"

#import "FXModelObserver.h"

@implementation FXModel

@synthesize state 			= _state;

#pragma mark -
#pragma mark Accessors

- (void)setState:(FXModelState)state {
	[self setState:state withChanges:nil];
}

- (void)setState:(FXModelState)state withChanges:(id)changes {
	if (state != _state) {
		_state = state;
	}
	
	[self notifyObserversWithSelector:[self selectorForState:state] withObject:changes];
}

#pragma mark -
#pragma mark Overloaded Methods

- (SEL)selectorForState:(FXModelState)state {
	SEL selector = NULL;
	switch (state) {
		case kFXModelWillLoad:
			selector = @selector(modelWillLoad:);
			break;
			
		case kFXModelLoaded:
			selector = @selector(modelDidLoad:);
			break;
			
		case kFXModelFailedLoading:
			selector = @selector(modelDidFailedLoading:);
			break;
			
		case kFXModelDidChange:
			selector = @selector(model:didChangeWithChanges:);
			break;
			
		case kFXModelUnloaded:
		default:
			break;
	}
	
	return selector;
}

@end
