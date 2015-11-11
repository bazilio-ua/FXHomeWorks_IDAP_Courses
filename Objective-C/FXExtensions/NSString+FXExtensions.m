//
//  NSString+FXExtensions.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/31/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>

#import "NSString+FXExtensions.h"

#import "FXAlphabet.h"

static const NSUInteger kFXDefaultRandomStringLength = 50;

@implementation NSString (FXExtensions)

#pragma mark -
#pragma mark Class Methods

+ (id)randomString {
	return [self randomStringWithLength:(arc4random() % (kFXDefaultRandomStringLength + 1))]; /* TODO: update xcode to 
																							   use arc4random_uniform */
}

+ (id)randomStringWithLength:(NSUInteger)length {
	return [self randomStringWithLength:length alphabet:[FXAlphabet alphanumericAlphabet]];
}

+ (id)randomStringWithLength:(NSUInteger)length alphabet:(FXAlphabet *)alphabet {
	NSMutableString *string = [NSMutableString stringWithCapacity:length];
	NSUInteger alphabetLength = [alphabet count];
	for (NSUInteger index = 0; index < length; index++) {
		[string appendFormat:@"%@", [alphabet stringAtIndex:(arc4random() % alphabetLength)]];
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

#if TARGET_OS_IPHONE
- (NSString *)URLEncodedString {
	return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, 
																				 (__bridge CFStringRef)self, 
																				 NULL, 
																				 CFSTR("!*'();:@&=+$,/?%#[]\" "), 
																				 kCFStringEncodingUTF8));
}
#endif

- (NSString *)sha256EncodedString {
	const char *string = [self UTF8String];
	unsigned char digest[CC_SHA256_DIGEST_LENGTH];
	CC_SHA256(string, (CC_LONG)strlen(string), digest);
	NSMutableString *result = [NSMutableString string];
	for (NSUInteger iterator = 0; iterator < CC_SHA256_DIGEST_LENGTH; iterator++) {
		[result appendFormat:@"%02x", digest[iterator]];
	}
	
	return result;
}

- (NSString *)sha512EncodedString {
	const char *string = [self UTF8String];
	unsigned char digest[CC_SHA512_DIGEST_LENGTH];
	CC_SHA512(string, (CC_LONG)strlen(string), digest);
	NSMutableString *result = [NSMutableString string];
	for (NSUInteger iterator = 0; iterator < CC_SHA512_DIGEST_LENGTH; iterator++) {
		[result appendFormat:@"%02x", digest[iterator]];
	}
	
	return result;
}

@end
