//
//  FXAlphabetRange.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/2/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXAlphabetRange.h"

@interface FXAlphabetRange ()
@property (nonatomic, assign) NSRange range;

@end

@implementation FXAlphabetRange
@synthesize range = _range;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	
	[super dealloc]; // dealloc superclass
}

- (id)initWithRange:(NSRange)range {
	self = [super init];
	
	if (self) {
		self.range = range;
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Methods

- (NSUInteger)count {
	return self.range.length;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
	NSRange range = self.range;
	
	NSAssert(range.length > index, NSRangeException); // sanity bounds of range
	
	return [NSString stringWithFormat:@"%C", (unichar)(range.location + index)];
}

@end
