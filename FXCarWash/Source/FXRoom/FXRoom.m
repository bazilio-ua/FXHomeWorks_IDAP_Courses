//
//  FXRoom.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXRoom.h"

#pragma mark -
#pragma mark Private Interface

@interface FXRoom ()
@property (nonatomic, retain)	NSMutableArray	*mutableEmployees;

@end

@implementation FXRoom
@synthesize mutableEmployees	= _mutableEmployees;
@synthesize employeeCapacity	= _employeeCapacity;

@dynamic employees;

#pragma mark -
#pragma mark Class Methods

+ (id)room {
	return [[[self alloc] init] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	self.mutableEmployees = nil;
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
	self = [super init]; // init superclass
	
	if (self) {
		self.mutableEmployees = [NSMutableArray array];
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Accessors

- (NSArray *)employees {
	return [[self.mutableEmployees copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)addEmployee:(id)employee {
	if (nil != employee) {
		NSMutableArray *employees = self.mutableEmployees;
		if ([employees count] < self.employeeCapacity && NO == [employees containsObject:employee]) {
			[employees addObject:employee];
		}
	}
}

- (void)removeEmployee:(id)employee {
	[self.mutableEmployees removeObject:employee];
}

@end
