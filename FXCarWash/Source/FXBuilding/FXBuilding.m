//
//  FXBuilding.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXBuilding.h"

#pragma mark -
#pragma mark Private Interface

@implementation FXBuilding
@synthesize rooms = _rooms;

#pragma mark -
#pragma mark Class Methods

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	self.rooms = nil;
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
	return [self initWithRooms:nil];
}

- (id)initWithRooms:(NSArray *)rooms {
	self = [super init]; // init superclass
	
	if (self) {
		self.rooms = [[NSMutableArray alloc] initWithArray:rooms]; // or use rooms mutableCopy?
	}
	
	return self;
}

#pragma mark -
#pragma mark Accessors

- (void)addRoom:(id)room {
	if (nil != room) {
		[self.rooms addObject:room];
	}
}

- (void)removeRoom:(id)room {
	[self.rooms removeObject:room];
}

@end
