//
//  FXEmployee.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXEmployee.h"

@implementation FXEmployee
@synthesize experience	= _experience;
@synthesize	salary 		= _salary;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
	return [self initWithExperience:0 salary:0];
}

- (id)initWithExperience:(uint64_t)experience 
				  salary:(NSInteger)salary 
{
	self = [super init]; // init superclass
	
	if (self) {
		self.experience = experience;
		self.salary = salary;
	}
	
	return self;
}

#pragma mark -
#pragma mark Public

- (id)performEmployeeSpecificJob {
	return nil;
}

@end
