//
//  FXAlphabet.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/31/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXAlphabet.h"

#import "NSString+FXExtensions.h"

#import "FXAlphabetCluster.h"
#import "FXAlphabetRange.h"
#import "FXAlphabetStrings.h"

@implementation FXAlphabet

#pragma mark -
#pragma mark Class Methods

+ (id)alphabetWithSymbols:(NSString *)symbols {
	return [self alphabetWithStrings:[symbols symbols]];
}

+ (id)alphabetWithStrings:(NSArray *)strings {
	return [[[FXAlphabetStrings alloc] initWithStrings:strings] autorelease];
}

+ (id)alphabetWithRange:(NSRange)range {
	return [[[FXAlphabetRange alloc] initWithRange:range] autorelease];
}

+ (id)alphabetWithAlphabets:(NSArray *)alphabets {
	return [[[FXAlphabetCluster alloc] initWithAlphabets:alphabets] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	
	[super dealloc]; // dealloc superclass
}

- (id)initWithSymbols:(NSString *)symbols {
	return [self initWithStrings:[symbols symbols]];
}

- (id)initWithStrings:(NSArray *)strings {
	[self release];
	
	return [[FXAlphabetStrings alloc] initWithStrings:strings];
}

- (id)initWithRange:(NSRange)range {
	[self release];
	
	return [[FXAlphabetRange alloc] initWithRange:range];
}

- (id)initWithAlphabets:(NSArray *)alphabets {
	[self release];
	
	return [[FXAlphabetCluster alloc] initWithAlphabets:alphabets];
}

#pragma mark -
#pragma mark Overriden Public Methods

// these should be overriden and not be invoked from superclass
- (NSUInteger)count {
	[self doesNotRecognizeSelector:_cmd];
	
	return 0;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
	[self doesNotRecognizeSelector:_cmd];
	
	return nil;
}

#pragma mark -
#pragma mark Public Methods

- (NSString *)objectAtIndexedSubscript:(NSUInteger)index {
	return [self stringAtIndex:index];
}

- (NSString *)string {
	NSMutableString *string = [NSMutableString string];
	for (NSString *symbol in self) {
		[string appendString:symbol];
	}
	
	return [[string copy] autorelease];
}

#pragma mark -
#pragma mark NSFastEnumeration for FXAlphabet

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state 
								  objects:(id __unsafe_unretained [])buffer 
									count:(NSUInteger)count 
{
	state->mutationsPtr = (unsigned long *)self;
	NSUInteger length = MIN(state->state + count, [self count]);
	count = length - state->state;
	for (NSUInteger index = 0; index < count; index++) {
		buffer[index] = self[index + state->state];
	}
	
	state->itemsPtr = buffer;
	state->state += count;
	
	return count;
}

@end
