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

+ (id)alphanumericAlphabet {
	NSMutableString *alphabet = [NSMutableString string];
	[alphabet appendString:[self letterAlphabet]];
	[alphabet appendString:[self numericAlphabet]];
	
	return [self stringWithString:alphabet];
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
	NSMutableString *alphabet = [NSMutableString string];
	[alphabet appendString:[self lowercaseLetterAlphabet]];
	[alphabet appendString:[self uppercaseLetterAlphabet]];
	[alphabet appendString:[self capitalizedLetterAlphabet]];
	
	return [self stringWithString:alphabet];
}

+ (id)alphabetWithUnicodeRange:(NSRange)range {
	NSMutableString *alphabet = [NSMutableString string];
	for (unichar character = range.location; character < NSMaxRange(range); character++) {
		[alphabet appendFormat:@"%C", character];
	}
	
	return [self stringWithString:alphabet];
}

+ (id)randomString {
	return nil;
}

+ (id)randomStringWithLength:(NSUInteger)length {
	return nil;
}

+ (id)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet {
	return nil;
}

@end
