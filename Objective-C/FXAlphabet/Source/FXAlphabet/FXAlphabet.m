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

// english alphabet with numbers
+ (id)alphanumericAlphabet {
	FXAlphabet *letterAlphabet = [FXAlphabet letterAlphabet];
	FXAlphabet *numericAlphabet = [FXAlphabet numericAlphabet];
	NSArray *alphabetsArray = [[[NSArray alloc] initWithObjects:letterAlphabet, numericAlphabet, nil] autorelease];
	
	return [self alphabetWithAlphabets:alphabetsArray];
}

+ (id)numericAlphabet {
	return [[[self alloc] initWithRange:NSMakeRange('0', 
													'9' - '0' + 1)] autorelease];
}

+ (id)lowercaseLetterAlphabet {
	return [[[self alloc] initWithRange:NSMakeRange('a', 
													'z' - 'a' + 1)] autorelease];
}

+ (id)uppercaseLetterAlphabet {
	return [[[self alloc] initWithRange:NSMakeRange('A', 
													'Z' - 'A' + 1)] autorelease];
}

+ (id)letterAlphabet {
	FXAlphabet *lowercaseLetterAlphabet = [FXAlphabet lowercaseLetterAlphabet];
	FXAlphabet *uppercaseLetterAlphabet = [FXAlphabet uppercaseLetterAlphabet];
	NSArray *lettersArray = [[[NSArray alloc] 
							  initWithObjects:lowercaseLetterAlphabet, uppercaseLetterAlphabet, nil] autorelease];
	
	return [self alphabetWithAlphabets:lettersArray];
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

// it's a very important selector because self[5] will actually turn into [self objectAtIndexedSubscript:5] 
// in most recent versions Xcode (CLANG v3.1 required)
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
#pragma mark NSFastEnumeration protocol

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state 
								  objects:(id *)buffer 
									count:(NSUInteger)count 
{
	state->mutationsPtr = (unsigned long *)self;
	
	NSUInteger currentOffset = state->state;
	NSUInteger length = MIN(currentOffset + count, [self count]);
	length -= currentOffset;
	
	for (NSUInteger index = 0; index < length; index++) {
//		buffer[index] = self[currentOffset + index]; // CLANG v3.1 required
		buffer[index] = [self objectAtIndexedSubscript:(currentOffset + index)];
	}
	
	state->itemsPtr = buffer;
	state->state += length;
	
	return length;
}

@end
