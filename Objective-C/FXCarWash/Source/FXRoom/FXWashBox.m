//
//  FXWashBox.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/19/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXWashBox.h"

#pragma mark -
#pragma mark Private Interface

@interface FXWashBox ()
@property (nonatomic, retain)	NSMutableArray	*mutableCars;

@end

@implementation FXWashBox
@synthesize mutableCars		= _mutableCars;
@synthesize carsCapacity	= _carsCapacity;
@synthesize full			= _full;

@dynamic cars;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	self.mutableCars = nil;
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
	self = [super init]; // init superclass
	
	if (self) {
		self.mutableCars = [NSMutableArray array];
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Accessors

- (NSArray *)cars {
	return [[self.mutableCars copy] autorelease];
}

- (BOOL)isFull { // TODO: merge this with addCar
	if ([self.mutableCars count] == self.carsCapacity) {
		return YES;
	}
	
	return NO;
}

#pragma mark -
#pragma mark Public Methods

- (void)addCar:(id)car {
	if (nil != car) {
		NSMutableArray *cars = self.mutableCars;
		if (NO == [cars containsObject:car]) {
			[cars addObject:car];
			NSLog(@"The car %@ stopped at a washbox %@", car, self);
		}
	}
}

- (void)removeCar:(id)car {
	[self.mutableCars removeObject:car];
	NSLog(@"The car %@ left the washbox %@", car, self);
}

@end
