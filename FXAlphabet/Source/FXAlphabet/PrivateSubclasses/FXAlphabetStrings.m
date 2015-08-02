//
//  FXAlphabetStrings.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/2/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXAlphabetStrings.h"

@interface FXAlphabetStrings ()
@property (nonatomic, retain)	NSArray		*strings;

@end

@implementation FXAlphabetStrings
@synthesize strings = _strings;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	self.strings = nil;
	
	[super dealloc]; // dealloc superclass
}

- (id)initWithStrings:(NSArray *)strings {
	self = [super init];
	
	if (self) {
		self.strings = strings;
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Methods

- (NSUInteger)count {
	return [self.strings count];
}

- (NSString *)stringAtIndex:(NSUInteger)index {
	NSArray *strings = self.strings;
	
	NSAssert([strings count] > index, NSRangeException); // sanity bounds of index range
	
	return [strings objectAtIndex:index];
}

@end
