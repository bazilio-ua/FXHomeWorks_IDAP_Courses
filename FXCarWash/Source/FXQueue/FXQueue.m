//
//  FXQueue.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/22/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXQueue.h"

#import "NSObject+FXExtensions.h"
#import "NSArray+FXExtensions.h"

@interface FXQueue ()
@property (nonatomic, retain)	NSMutableArray	*mutableQueue;

@end

@implementation FXQueue
@synthesize mutableQueue = _mutableQueue;

@end
