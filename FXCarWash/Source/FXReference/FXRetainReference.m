//
//  FXRetainReference.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/11/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXRetainReference.h"

@interface FXRetainReference ()
@property (nonatomic, retain)	id	target;

@end

@implementation FXRetainReference

@synthesize target = _target;

@end
