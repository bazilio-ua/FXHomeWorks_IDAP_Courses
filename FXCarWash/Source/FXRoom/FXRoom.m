//
//  FXRoom.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXRoom.h"

@implementation FXRoom
@synthesize employees = _employees;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	self.employees = nil;
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
	return [self initWithEmployees:nil];
}

- (id)initWithEmployees:(NSArray *)employees {
	self = [super init]; // init superclass
	
	if (self) {
		self.employees = [[NSMutableArray alloc] initWithArray:employees]; // or use employees mutableCopy?
	}
	
	return self;
}

- (void)addEmployee:(id)employee {
	if (nil != employee) {
		[self.employees addObject:employee];
	}
}

- (void)removeEmployee:(id)employee {
	[self.employees removeObject:employee];
}

@end
