//
//  FXMainView.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/9/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXMainView.h"

#import "FXSquareView.h"

@implementation FXMainView

@synthesize squareView			= _squareView;
@synthesize moveButton			= _moveButton;
@synthesize cyclicMoveButton	= _cyclicMoveButton;

#pragma mark -
#pragma mark Public Methods

- (void)updateCyclicMoveButtonTitle {
	[self.cyclicMoveButton setTitle:self.squareView.isCyclicMove ? @"Stop Cycle" : @"Cyclic Move" 
						   forState:UIControlStateNormal];
}

@end
