//
//  NSString+FXExtensions.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/31/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "NSString+FXExtensions.h"

static const NSUInteger kFXDefaultRandomStringLength = 40;

@implementation NSString (FXExtensions)

#pragma mark -
#pragma mark Class Methods

// english alphabet with numbers
+ (id)alphanumericAlphabet {
	NSMutableString *string = [NSMutableString string];
	[string appendString:[self letterAlphabet]];
	[string appendString:[self numericAlphabet]];
	
	return [self stringWithString:string];
}

+ (id)numericAlphabet {
	return [self alphabetWithUnicodeRange:NSMakeRange('0', 
													  '9' - '0' + 1)];
}

+ (id)lowercaseLetterAlphabet {
	return [self alphabetWithUnicodeRange:NSMakeRange('a', 
													  'z' - 'a' + 1)];
}

+ (id)uppercaseLetterAlphabet {
	return [self alphabetWithUnicodeRange:NSMakeRange('A', 
													  'Z' - 'A' + 1)];
}

+ (id)letterAlphabet {
	NSMutableString *string = [NSMutableString string];
	[string appendString:[self lowercaseLetterAlphabet]];
	[string appendString:[self uppercaseLetterAlphabet]];
	
	return [self stringWithString:string];
}

+ (id)alphabetWithUnicodeRange:(NSRange)range {
	NSMutableString *string = [NSMutableString string];
	for (unichar character = range.location; character < NSMaxRange(range); character++) {
		[string appendFormat:@"%C", character];
	}
	
	return [self stringWithString:string];
}

+ (id)randomString {
	return [self randomStringWithLength:(arc4random() % (kFXDefaultRandomStringLength + 1))]; /* TODO: update xcode to 
																							   use arc4random_uniform */
}

+ (id)randomStringWithLength:(NSUInteger)length {
	return [self randomStringWithLength:length alphabet:[self alphanumericAlphabet]];
}

+ (id)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet {
	NSMutableString *string = [NSMutableString stringWithCapacity:length];
	NSUInteger alphabetLength = [alphabet length];
	for (NSUInteger index = 0; index < length; index++) {
		unichar character = [alphabet characterAtIndex:(arc4random() % alphabetLength)];
		[string appendFormat:@"%C", character];
	}
	
	return [self stringWithString:string];
}

#pragma mark -
#pragma mark Public Methods

- (NSArray *)symbols {
	NSUInteger length = [self length];
	NSMutableArray *symbolsArray = [NSMutableArray arrayWithCapacity:length];
	for (NSUInteger index = 0; index < length; index++) {
		[symbolsArray addObject:[NSString stringWithFormat:@"%C", [self characterAtIndex:index]]];
	}
	
	return [[symbolsArray copy] autorelease];
}

@end
