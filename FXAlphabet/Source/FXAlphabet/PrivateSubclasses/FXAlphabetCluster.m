//
//  FXAlphabetCluster.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/2/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXAlphabetCluster.h"

@interface FXAlphabetCluster ()
@property (nonatomic, retain)	NSArray		*alphabets;
@property (nonatomic, assign)	NSUInteger	count;

@end

@implementation FXAlphabetCluster
@synthesize alphabets	= _alphabets;
@synthesize count		= _count;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	self.alphabets = nil;
	
	[super dealloc]; // dealloc superclass
}

- (id)initWithAlphabets:(NSArray *)alphabets {
	self = [super init];
	
	if (self) {
		self.alphabets = alphabets;
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Methods

- (NSUInteger)count {
	NSArray *alphabets = self.alphabets;
	NSUInteger count = 0;
	for (FXAlphabet *alphabet in alphabets) {
		count += [alphabet count];
	}
	
	return count;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
	NSAssert(self.count > index, NSRangeException); // sanity bounds of index range
	
	for (FXAlphabet *alphabet in self.alphabets) {
		NSUInteger count = [alphabet count];
		if (count > index) {
//			return alphabet[index]; // CLANG v3.1 required
			return [alphabet objectAtIndexedSubscript:index];
		}
		
		index -= count;
	}
	
	return nil;
}

- (NSString *)string {
	NSMutableString *string = [NSMutableString stringWithCapacity:self.count];
	for (FXAlphabet *alphabet in self.alphabets) {
		[string appendString:[alphabet string]];
	}
	
	return [[string copy] autorelease]; // analyzer say: there is a potential leak, so balance 'copy' with 'autorelease'
}

@end
