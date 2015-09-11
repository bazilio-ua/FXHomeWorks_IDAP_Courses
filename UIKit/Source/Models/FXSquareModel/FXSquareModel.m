//
//  FXSquareModel.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/9/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXSquareModel.h"

@implementation FXSquareModel

@synthesize squarePosition = _squarePosition;

#pragma mark -
#pragma mark Public Methods

- (FXSquarePosition)moveSquarePosition {
	return (self.squarePosition + 1) % kFXSquarePositionCount;
}

@end