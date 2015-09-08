//
//  FXAlphabetTests.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXAlphabetTests.h"

#import "NSString+FXExtensions.h"

#import "FXAlphabet.h"
#import "FXAlphabetCluster.h"
#import "FXAlphabetRange.h"
#import "FXAlphabetStrings.h"

@implementation FXAlphabetTests

+ (void)performRandomStringTest {
	NSLog(@"perform Random String tests");
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
	
	NSLog(@" ");
	NSLog(@"NSString extensions tests 3: custom (hebrew) alphabet generation");
	NSLog(@"%@", [NSString alphabetWithUnicodeRange:NSMakeRange(1488, 1514 - 1488 + 1)]);
	
	NSLog(@" ");
	NSLog(@"NSString extensions tests 4: custom (runic) alphabet generation");
	NSLog(@"%@", [NSString alphabetWithUnicodeRange:NSMakeRange(5792, 5872 - 5792 + 1)]);
	
	NSLog(@" ");
	NSLog(@"NSString extensions tests 5: custom (devanagari) alphabet generation");
	NSLog(@"%@", [NSString alphabetWithUnicodeRange:NSMakeRange(2309, 2361 - 2309 + 1)]);
	
//	NSLog(@" ");
//	NSLog(@"%@", [NSCharacterSet alphanumericCharacterSet]);
//	
//	NSLog(@"%@", [NSString alphabetWithUnicodeRange:NSMakeRange(0x0400, 0x04FF - 0x0400 + 0x1)]);
}

// TODO: make these tests with kiwi Framework!
+ (void)performAlphabetTest {
	NSLog(@"perform Alphabet tests");
	NSLog(@" ");

	NSLog(@"Alphabet test1: String alphabet");
	NSArray *alphabetStrings = [[[NSArray alloc] initWithObjects:@"string1", @"string2", nil] autorelease];
	FXAlphabet *alphabet = [FXAlphabet alphabetWithStrings:alphabetStrings];
	NSLog(@"%@", alphabet); // show description (kind of class) 'FXAlphabetStrings'
	NSLog(@"%lu", [alphabet count]); // show '2'
	NSLog(@"%@", [alphabet stringAtIndex:1]); // show 'string2'
	NSLog(@"%@", [alphabet string]); // show 'string1string2'
	NSUInteger count = 0;
	NSLog(@"enumerated strings alphabet");
	for (NSString *strings in alphabet) {
		NSLog(@"%@", strings);
		count++;
	}
	NSLog(@"count: %lu, [alphabet count]: %lu", count, [alphabet count]); // 2 == 2
	count = 0;
	alphabet = nil;
	
	NSLog(@" ");
	NSLog(@"Alphabet test2: Range alphabet");
	NSRange range = NSMakeRange('A', 'F' - 'A' + 1);
	alphabet = [FXAlphabet alphabetWithRange:range];
	NSLog(@"%@", alphabet); // show description (kind of class) 'FXAlphabetRange'
	NSLog(@"%@", [alphabet string]); // show 'ABCDEF'
	NSMutableString *string = [NSMutableString string];
	for (id symbol in alphabet) {
//		NSLog(@"%@", symbol);
		[string appendString:symbol];
		count++;
	}
	NSLog(@"enumerated range alphabet: %@", string);
	NSLog(@"count: %lu, range.length: %lu", count, range.length); // 6 == 6
	count = 0;
	alphabet = nil;
	
	NSLog(@" ");
	NSLog(@"Alphabet test3: Cluster alphabet");
	FXAlphabet *uppercaseAlphabet = [FXAlphabet alphabetWithRange:NSMakeRange('A', 'Z' - 'A' + 1)];
	FXAlphabet *lowercaseAlphabet = [FXAlphabet alphabetWithRange:NSMakeRange('a', 'z' - 'a' + 1)];
	FXAlphabet *numericAlphabet = [FXAlphabet alphabetWithRange:NSMakeRange('0', '9' - '0' + 1)];
	NSArray *alphabetCluster = [[[NSArray alloc] 
								 initWithObjects:uppercaseAlphabet, lowercaseAlphabet, numericAlphabet, nil] autorelease];
	alphabet = [FXAlphabet alphabetWithAlphabets:alphabetCluster];
	NSLog(@"%@", alphabet); // show description (kind of class) 'FXAlphabetCluster'
	NSLog(@"%lu", [alphabet count]); // show '62'
	NSLog(@"%@", [alphabet string]); // show all alphanumeric
	NSLog(@"%@", [alphabet stringAtIndex:0]); // show 'A'
	NSLog(@"%@", [alphabet stringAtIndex:25]); // show 'Z'
	NSLog(@"%@", [alphabet stringAtIndex:26]); // show 'a'
	NSLog(@"%@", [alphabet stringAtIndex:51]); // show 'z'
	NSLog(@"%@", [alphabet stringAtIndex:52]); // show '0'
	NSLog(@"%@", [alphabet stringAtIndex:61]); // show '9'
	for (NSString *symbol in alphabet) {
//		NSLog(@"%@", symbol);
		[string appendString:symbol];
		count++;
	}
	NSLog(@"enumerated cluster alphabet: %@", string);
	NSLog(@"count: %lu, [alphabet count]: %lu", count, [alphabet count]); // 62 == 62
	count = 0;
	alphabet = nil;
}

@end
