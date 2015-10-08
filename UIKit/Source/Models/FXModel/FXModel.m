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

#pragma mark -
#pragma mark Overloaded Methods

- (SEL)selectorForState:(FXModelState)state {
	SEL selector = NULL;
	switch (state) {
		case kFXModelDidChange:
			selector = @selector(model:didChangeWithChanges:);
			break;
			
		default:
			break;
	}
	
	return selector;
}

@end
