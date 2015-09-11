//
//  FXMainView.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/9/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXMainView.h"

#import "FXSquareView.h"
#import "FXSquareModel.h"

static const NSTimeInterval kFXSquareViewAnimationDuration = 0.5;
static const NSTimeInterval kFXSquareViewAnimationDelay = 0;

@interface FXMainView ()

- (CGRect)frameForSquarePosition:(FXSquarePosition)position;

@end

@implementation FXMainView

@synthesize squareView = _squareView;
@synthesize squareMove = _squareMove;

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
	NSTimeInterval duration = animated ? kFXSquareViewAnimationDuration : 0;
	
	[UIView animateWithDuration:duration 
						  delay:kFXSquareViewAnimationDelay 
						options:UIViewAnimationOptionBeginFromCurrentState 
					 animations:^{
						 self.squareView.frame = [self frameForSquarePosition:position];
					 } 
					 completion:^(BOOL finished) {
						 self.squareView.squareModel.squarePosition = position;
						 
						 if (completion) {
							 completion(finished);
						 }
					 }];
}

#pragma mark -
#pragma mark Private Methods

- (CGRect)frameForSquarePosition:(FXSquarePosition)position {
	CGRect frame = self.squareView.frame;
	CGRect bounds = self.superview.bounds;
	CGPoint point = CGPointZero;
	
	switch (position) {
		case kFXSquarePositionTopLeft:
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
