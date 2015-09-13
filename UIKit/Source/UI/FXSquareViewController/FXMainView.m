//
//  FXMainView.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/9/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXMainView.h"

@implementation FXMainView

@synthesize squareView			= _squareView;
@synthesize squareMove			= _squareMove;
@synthesize squareCyclicMove	= _squareCyclicMove;

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
