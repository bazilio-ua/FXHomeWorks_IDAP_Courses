//
//  FXEmployee.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXEmployee.h"

@implementation FXEmployee
@synthesize wallet		= _wallet;

#pragma mark -
#pragma mark Class Methods

+ (id)employee {
	return [[[self alloc] init] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
	self = [super init]; // init superclass
	
	if (self) {
		self.wallet = 0;
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Methods

- (id)performEmployeeSpecificJob {
	return nil;
}

@end
