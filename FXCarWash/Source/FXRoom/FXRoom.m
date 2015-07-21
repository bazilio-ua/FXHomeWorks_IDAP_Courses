//
//  FXRoom.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXRoom.h"

@implementation FXRoom
@synthesize employees			= _employees;
@synthesize employeeCapacity	= _employeeCapacity;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	self.employees = nil;
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
	self = [super init]; // init superclass
	
	if (self) {
		self.employees = [NSMutableArray array];
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)addEmployee:(id)employee {
	if (nil != employee) {
		[self.employees addObject:employee];
	}
}

- (void)removeEmployee:(id)employee {
	[self.employees removeObject:employee];
}

@end
