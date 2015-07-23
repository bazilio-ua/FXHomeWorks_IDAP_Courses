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

@interface FXBuilding ()
@property (nonatomic, retain) NSMutableArray *mutableRooms;

@end

@implementation FXBuilding
@synthesize mutableRooms = _mutableRooms;
@dynamic rooms;

#pragma mark -
#pragma mark Class Methods

+ (id)building {
	return [[[self alloc] init] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	self.mutableRooms = nil;
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
	self = [super init]; // init superclass
	
	if (self) {
		self.mutableRooms = [NSMutableArray array];
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Accessors

- (NSArray *)rooms {
	return [[self.mutableRooms copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)addRoom:(id)room {
	if (nil != room) {
		[self.mutableRooms addObject:room];
	}
}

- (void)removeRoom:(id)room {
	[self.mutableRooms removeObject:room];
}

@end
