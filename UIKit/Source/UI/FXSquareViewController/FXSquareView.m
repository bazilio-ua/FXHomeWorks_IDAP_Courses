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

@synthesize cyclicMoving	= _cyclicMoving;

#pragma mark -
#pragma mark Public Methods

- (void)moveSquareToNextPosition {
	if (![self.squareFrame isAnimating]) {
		[self.squareFrame setSquarePosition:[self.squareFrame.squareModel nextPosition] 
					   animated:YES];
	}
}

- (void)cyclicMoveSquareToNextPosition {
	if ([self isCyclicMoving] && ![self.squareFrame isAnimating]) {
		id __weak weakSelf = self;
		void(^completionBlock)(BOOL finished) = ^(BOOL finished) {
			if (finished) {
				id __strong strongSelf = weakSelf;
				[strongSelf cyclicMoveSquareToNextPosition];
			}
		};
		
		[self.squareFrame setSquarePosition:[self.squareFrame.squareModel nextPosition] 
					   animated:YES 
			   completionHanler:completionBlock];
	}
}

#pragma mark -
#pragma mark Public Methods

- (void)updateCyclicMoveButtonTitle {
	[self.cyclicMoveButton setTitle:[self isCyclicMoving] ? @"Stop Cycle" : @"Cyclic Move" 
						   forState:UIControlStateNormal];
}

@end
