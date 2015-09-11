//
//  FXSquareView.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/9/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXSquareView.h"

static const NSTimeInterval kFXSquareViewAnimationDuration = 0.5;
static const NSTimeInterval kFXSquareViewAnimationDelay = 0.1;

@interface FXSquareView ()

- (CGRect)frameForSquarePosition:(FXSquarePosition)position;

@end

@implementation FXSquareView

@synthesize squareModel = _squareModel;

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
	
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(FXSquarePosition)position {
	[self setSquarePosition:position 
				   animated:NO];
}

- (void)setSquarePosition:(FXSquarePosition)position 
				 animated:(BOOL)animated {
	[self setSquarePosition:position 
				   animated:animated 
		   completionHanler:nil];
}

- (void)setSquarePosition:(FXSquarePosition)position 
				 animated:(BOOL)animated 
		 completionHanler:(void (^)(BOOL finished))completion {
	self.squareModel.squarePosition = position;
	
	NSTimeInterval duration = animated ? kFXSquareViewAnimationDuration : 0;
	
	[UIView animateWithDuration:duration 
						  delay:kFXSquareViewAnimationDelay 
						options:UIViewAnimationOptionBeginFromCurrentState 
					 animations:^{
						 self.frame = [self frameForSquarePosition:position];
					 } 
					 completion:^(BOOL finished) {
						 if (completion) {
							 completion(finished);
						 }
					 }];
}

#pragma mark -
#pragma mark Private Methods

- (CGRect)frameForSquarePosition:(FXSquarePosition)position {
	CGRect frame = self.frame;
	CGRect bounds = self.superview.bounds;
	CGPoint point = CGPointZero;
	
	switch (position) {
		case kFXSquarePositionTopLeft: // default
			break;
			
		case kFXSquarePositionTopRight:
			point.x = CGRectGetWidth(bounds) - CGRectGetWidth(frame);
			break;
			
		case kFXSquarePositionBottomRight:
			point.x = CGRectGetWidth(bounds) - CGRectGetWidth(frame);
			point.y = CGRectGetHeight(bounds) - CGRectGetHeight(frame);
			break;
			
		case kFXSquarePositionBottomLeft:
			point.y = CGRectGetHeight(bounds) - CGRectGetHeight(frame);
			break;
			
		default:
			break;
	}
	
	frame.origin = point;
	
	return frame;
}

@end
