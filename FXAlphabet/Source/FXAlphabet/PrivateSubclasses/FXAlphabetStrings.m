//
//  FXAlphabetStrings.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/2/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXAlphabetStrings.h"

@interface FXAlphabetStrings ()
@property (nonatomic, retain) NSArray *privateStrings;

@end

@implementation FXAlphabetStrings
@synthesize privateStrings = _privateStrings;

//@dynamic strings;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	self.privateStrings = nil;
	
	[super dealloc]; // dealloc superclass
}

- (id)initWithStrings:(NSArray *)strings {
	self = [super init];
	
	if (self) {
		self.privateStrings = strings;
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Accessors

//- (NSArray *)strings {
//	return [[self.privateStrings copy] autorelease];
//}

#pragma mark -
#pragma mark Public Methods

- (NSUInteger)count {
	return [self.privateStrings count];
}

- (NSString *)stringAtIndex:(NSUInteger)index {
	NSArray *strings = self.privateStrings;
	
	NSAssert([strings count] > index, NSRangeException); // sanity bounds of index range
	
	return [strings objectAtIndex:index];
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state 
								  objects:(id *)buffer 
									count:(NSUInteger)count
{
	return [self.privateStrings countByEnumeratingWithState:state objects:buffer count:count];
}

@end
