//
//  FXAlphabetTests.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXAlphabetTests.h"

#import "NSString+FXExtensions.h"

@implementation FXAlphabetTests

+ (void)performTest {
	NSLog(@"perform FXAlphabet tests");
	NSLog(@" ");
	
	NSLog(@"NSString extensions tests 1: random string generation");
	NSLog(@"%@", [NSString randomString]);
	NSLog(@"%@", [NSString randomStringWithLength:5]);
	NSLog(@"%@", [NSString randomStringWithLength:10 alphabet:[NSString numericAlphabet]]);
	NSLog(@" ");

	NSLog(@"NSString extensions tests 2: alphabet generation");

	SEL selectors[] = {
		@selector(alphanumericAlphabet),
		@selector(numericAlphabet),
		@selector(lowercaseLetterAlphabet),
		@selector(uppercaseLetterAlphabet),
		@selector(letterAlphabet)
	};
	
	NSUInteger count = sizeof(selectors) / sizeof(*selectors);
	id class = [NSString class];
	
	for (NSUInteger index = 0; index < count; index++) {
		NSLog(@"%@", [class performSelector:selectors[index]]);
	}
}

@end
