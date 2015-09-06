//
//  FXEmployeesPool.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/3/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXEmployeesPool.h"
#import "FXEmployee.h"

@interface FXEmployeesPool ()
@property (nonatomic, retain)	NSMutableArray	*mutableEmployees;

@end

@implementation FXEmployeesPool

@synthesize mutableEmployees	= _mutableEmployees;

@dynamic employees;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	self.mutableEmployees = nil;
	
	[super dealloc];
}

- (id)init {
	self = [super init];
	if (self) {
		self.mutableEmployees = [NSMutableArray array];
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Accessors

- (NSArray *)employees {
	id syncEmployees = self.mutableEmployees;
	@synchronized(syncEmployees) {
		return [[syncEmployees copy] autorelease];
	}
}

#pragma mark -
#pragma mark Public Methods

- (void)addEmployee:(id)employee {
	id syncEmployees = self.mutableEmployees;
	@synchronized(syncEmployees) {
		[syncEmployees addObject:employee];
	}
}

- (void)removeEmployee:(id)employee {
	id syncEmployees = self.mutableEmployees;
	@synchronized(syncEmployees) {
		[syncEmployees removeObject:employee];
	}
}

- (BOOL)containsEmployee:(id)employee {
	id syncEmployees = self.mutableEmployees;
	@synchronized(syncEmployees) {
		return [syncEmployees containsObject:employee];
	}	
}

//- (NSArray *)allEmployeesOfClass:(Class)class {
//	id syncEmployees = self.mutableEmployees;
//	@synchronized(syncEmployees) {
//		NSMutableArray *employees = [NSMutableArray array];
//		for (FXEmployee *employee in syncEmployees) {
////			if ([employee isMemberOfClass:class]) {
//			if ([employee isKindOfClass:class]) {
//				[employees addObject:employee];
//			}
//		}
//		
//		return [[employees copy] autorelease];
//	}
//}
//
//- (id)readyEmployeeOfClass:(Class)class {
//	NSArray *employees = [self allEmployeesOfClass:class];
//	for (FXEmployee *employee in employees) {
//		if (kFXEmployeeIsReady == employee.state) {
//			return employee;
//		}
//	}
//	
//	return nil;
//}

- (id)readyEmployee {
	id syncEmployees = self.mutableEmployees;
	@synchronized(syncEmployees) {
		for (FXEmployee *employee in syncEmployees) {
			if (kFXEmployeeIsReady == employee.state) {
				return employee;
			}
		}
	}
	
	return nil;
}

@end
