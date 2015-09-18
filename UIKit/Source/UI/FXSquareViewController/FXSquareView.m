//
//  FXSquareView.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/9/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXSquareView.h"

#import "FXSquareFrame.h"

@implementation FXSquareView

@synthesize squareFrame			= _squareView;
@synthesize moveButton			= _moveButton;
@synthesize cyclicMoveButton	= _cyclicMoveButton;

#pragma mark -
#pragma mark Public Methods

- (void)updateCyclicMoveButtonTitle {
	[self.cyclicMoveButton setTitle:[self.squareFrame isCyclicMoving] ? @"Stop Cycle" : @"Cyclic Move" 
						   forState:UIControlStateNormal];
}

@end
