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

// titlecase alphabet
+ (id)capitalizedLetterAlphabet {
//	capitalized letters is not the same as uppercase letters:
//	http://stackoverflow.com/questions/1680082/how-to-check-if-my-string-starts-with-uppercase-character
	
//	NSCharacterSet
	return nil;
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
	return [self randomStringWithLength:(arc4random() % (kFXDefaultRandomStringLength + 1))];
}

+ (id)randomStringWithLength:(NSUInteger)length {
	return [self randomStringWithLength:length alphabet:[self alphanumericAlphabet]];
}

+ (id)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet {
	NSMutableString *string = [NSMutableString stringWithCapacity:length];
	NSUInteger alphabetLength = [alphabet length];
	for (NSUInteger index = 0; index < length; index++) {
		unichar character = [alphabet characterAtIndex:(arc4random() % (alphabetLength + 1))];
		[string appendFormat:@"%C", character];
	}
	
	return [self stringWithString:string];
}

@end
