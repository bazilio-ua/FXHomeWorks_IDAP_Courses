//
//  FXReference.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/11/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXReference.h"

@interface FXReference ()
@property (nonatomic, assign)	id	target;

@end

@implementation FXReference

@dynamic target;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	self.target = nil;
	
	[super dealloc]; // dealloc superclass
}

// overriding in subclasses
- (id)initWithTarget:(id)object {
	if (nil == object) {
		return nil;
	}
	
	self = [super init]; // init superclass
	
	if (self) {
		self.target = object;
	}
	
	return self;
}

#pragma mark -
#pragma mark NSCopying Protocol

- (id)copyWithZone:(NSZone *)zone {
	return [[[self class] alloc] initWithTarget:self.target];
}

#pragma mark -
#pragma mark NSObject equality

- (NSUInteger)hash {
	return [self.target hash];
}

- (BOOL)isEqual:(FXReference *)object {
	return [object isMemberOfClass:[self class]] && object.target == self.target;
}

@end
