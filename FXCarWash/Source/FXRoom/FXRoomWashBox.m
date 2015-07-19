//
//  FXRoomWashBox.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/19/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXRoomWashBox.h"

@implementation FXRoomWashBox
@synthesize cars = _cars;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	self.cars = nil;
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
	self = [super init]; // init superclass
	
	if (self) {
		self.cars = [NSMutableArray array];
	}
	
	return self;
}

#pragma mark -
#pragma mark Accessors

- (void)addCar:(id)car {
	if (nil != car) {
		[self.cars addObject:car];
	}
}

- (void)removeCar:(id)car {
	[self.cars removeObject:car];
}

@end
