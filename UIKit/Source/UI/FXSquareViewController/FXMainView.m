//
//  FXMainView.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/9/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXMainView.h"

#import "FXSquareModel.h"

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
	
}

#pragma mark -
#pragma mark Private Methods

- (CGRect)frameForSquarePosition:(FXSquarePosition)position {
	return CGRectNull;
}

@end
