//
//  FXSquareFrame.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/9/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXSquareFrame.h"

static const NSTimeInterval kFXSquareViewAnimationDuration	= 0.5;
static const NSTimeInterval kFXSquareViewAnimationDelay		= 0.05;

@interface FXSquareFrame ()

- (CGRect)frameForSquarePosition:(FXSquarePosition)position;

@end

@implementation FXSquareFrame

@synthesize squareModel 	= _squareModel;
@synthesize cyclicMoving	= _cyclicMoving;
@synthesize animating 		= _animating;

#pragma mark -
#pragma mark Public Methods

- (void)moveSquareToNextPosition {
	if (![self isAnimating]) {
		[self setSquarePosition:[self.squareModel nextPosition] 
					   animated:YES];
	}
}

- (void)cyclicMoveSquareToNextPosition {
	if ([self isCyclicMoving] && ![self isAnimating]) {
		id __weak weakSelf = self;
		void(^completionBlock)(BOOL finished) = ^(BOOL finished) {
			if (finished) {
				id __strong strongSelf = weakSelf;
				[strongSelf cyclicMoveSquareToNextPosition];
			}
		};
		
		[self setSquarePosition:[self.squareModel nextPosition] 
					   animated:YES 
			   completionHanler:completionBlock];
	}
}

#pragma mark -
#pragma mark Private Accessors

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
	
	[UIView animateWithDuration:duration 
						  delay:delay 
						options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveLinear 
					 animations:^{
						 self.animating = YES;
						 self.frame = [self frameForSquarePosition:position];
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

#pragma mark -
#pragma mark Private Methods

- (CGRect)frameForSquarePosition:(FXSquarePosition)position {
	CGRect frame = self.frame;
	CGRect bounds = self.superview.bounds;
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

@end
