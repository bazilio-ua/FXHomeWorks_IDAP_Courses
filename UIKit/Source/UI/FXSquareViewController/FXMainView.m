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

@end
