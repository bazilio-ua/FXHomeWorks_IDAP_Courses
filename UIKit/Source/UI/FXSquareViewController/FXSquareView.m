//
//  FXSquareView.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/9/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXSquareView.h"

#import "FXMacros.h"

static const NSTimeInterval kFXSquareViewAnimationDuration	= 0.5;
static const NSTimeInterval kFXSquareViewAnimationDelay		= 0.0;

static NSString * const kFXCyclicMoveButtonTitleStart 		= @"Cycle";
static NSString * const kFXCyclicMoveButtonTitleStop 		= @"Stop";

@interface FXSquareView ()

- (void)setSquarePosition:(FXSquarePosition)position;
- (void)setSquarePosition:(FXSquarePosition)position 
				 animated:(BOOL)animated;
- (void)setSquarePosition:(FXSquarePosition)position 
				 animated:(BOOL)animated 
		 completionHanler:(void (^)(BOOL finished))completion;

- (CGRect)frameForSquarePosition:(FXSquarePosition)position;

- (void)updateCyclicMoveButtonTitle;

@end

@implementation FXSquareView

@synthesize squareModel 		= _squareModel;
@synthesize squareView			= _squareView;

@synthesize moveButton			= _moveButton;
@synthesize cyclicMoveButton	= _cyclicMoveButton;

@synthesize cyclicMoving		= _cyclicMoving;
@synthesize animating 			= _animating;

#pragma mark -
#pragma mark Accessors

- (void)setCyclicMoving:(BOOL)cyclicMoving {
	if (_cyclicMoving != cyclicMoving) {
		_cyclicMoving = cyclicMoving;
		
		[self cyclicMoveSquareToRandomPosition];
	}
}

- (void)setAnimating:(BOOL)animating {
	if (_animating != animating) {
		_animating = animating;
		
		[self updateCyclicMoveButtonTitle];
	}
}

#pragma mark -
#pragma mark Public Methods

- (void)moveSquareToNextPosition {
	if (![self isAnimating]) {
		[self setSquarePosition:[self.squareModel nextPosition] 
					   animated:YES];
	}
}

- (void)cyclicMoveSquareToRandomPosition {
	if ([self isCyclicMoving] && ![self isAnimating]) {
//		id __weak weakSelf = self;
		FXWeakify(self);
		void(^completionBlock)(BOOL finished) = ^(BOOL finished) {
			if (finished) {
//				id __strong strongSelf = weakSelf;
				FXStrongify(self);
				[self cyclicMoveSquareToRandomPosition];
			}
		};
		
		[self setSquarePosition:[self.squareModel randomPosition] 
					   animated:YES 
			   completionHanler:completionBlock];
	}
}

#pragma mark -
#pragma mark Private Methods

- (void)setSquarePosition:(FXSquarePosition)position {
	[self setSquarePosition:position 
				   animated:NO];
}

- (void)setSquarePosition:(FXSquarePosition)position 
				 animated:(BOOL)animated 
{
	[self setSquarePosition:position 
				   animated:animated 
		   completionHanler:nil];
}

- (void)setSquarePosition:(FXSquarePosition)position 
				 animated:(BOOL)animated 
		 completionHanler:(void (^)(BOOL finished))completion 
{
	NSTimeInterval duration = animated ? kFXSquareViewAnimationDuration : 0;
	NSTimeInterval delay = animated ? kFXSquareViewAnimationDelay : 0;
	
	NSLog(@"position %d", position);
	[UIView animateWithDuration:duration 
						  delay:delay 
						options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveLinear 
					 animations:^{
						 self.animating = YES;
						 self.squareView.frame = [self frameForSquarePosition:position];
					 } 
					 completion:^(BOOL finished) {
						 if (finished) {
							 self.animating = NO;
							 self.squareModel.squarePosition = position;
							 if (completion) {
								 completion(finished);
							 }
						 }
					 }];
}

- (CGRect)frameForSquarePosition:(FXSquarePosition)position {
	UIView *squareView = self.squareView;
	CGRect frame = squareView.frame;
	CGRect bounds = squareView.superview.bounds;
	CGPoint point = CGPointZero;
	CGFloat pointX = CGRectGetWidth(bounds) - CGRectGetWidth(frame);
	CGFloat pointY = CGRectGetHeight(bounds) - CGRectGetHeight(frame);
	
	switch (position) {
		case kFXSquarePositionTopRight:
			point.x = pointX;
			break;
			
		case kFXSquarePositionBottomRight:
			point = CGPointMake(pointX, pointY);
			break;
			
		case kFXSquarePositionBottomLeft:
			point.y = pointY;
			break;
			
		case kFXSquarePositionTopLeft: // default
		default:
			break;
	}
	
	frame.origin = point;
	
	return frame;
}

- (void)updateCyclicMoveButtonTitle {
	NSString *title = [self isCyclicMoving] ? kFXCyclicMoveButtonTitleStop : kFXCyclicMoveButtonTitleStart;
	[self.cyclicMoveButton setTitle:title
						   forState:UIControlStateNormal];
}

@end
