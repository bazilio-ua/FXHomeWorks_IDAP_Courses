//
//  FXAlphabet.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/31/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FXAlphabet : NSObject <NSFastEnumeration>

+ (id)alphabetWithSymbols:(NSString *)symbols;
+ (id)alphabetWithStrings:(NSArray *)strings;
+ (id)alphabetWithRange:(NSRange)range;
+ (id)alphabetWithAlphabets:(NSArray *)alphabets;

+ (id)alphanumericAlphabet;
+ (id)numericAlphabet;
+ (id)lowercaseLetterAlphabet;
+ (id)uppercaseLetterAlphabet;
+ (id)letterAlphabet;

- (id)initWithSymbols:(NSString *)symbols;
- (id)initWithStrings:(NSArray *)strings;
- (id)initWithRange:(NSRange)range;
- (id)initWithAlphabets:(NSArray *)alphabets;

// these should be overriden and not be invoked from superclass
- (NSUInteger)count;
- (NSString *)stringAtIndex:(NSUInteger)index;

- (NSString *)objectAtIndexedSubscript:(NSUInteger)index;
- (NSString *)string;

@end
