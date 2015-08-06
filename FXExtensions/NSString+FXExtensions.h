//
//  NSString+FXExtensions.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/31/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FXExtensions)

+ (id)alphanumericAlphabet;
+ (id)numericAlphabet;
+ (id)lowercaseLetterAlphabet;
+ (id)uppercaseLetterAlphabet;
+ (id)letterAlphabet;

+ (id)alphabetWithUnicodeRange:(NSRange)range;

+ (id)randomString;
+ (id)randomStringWithLength:(NSUInteger)length;
+ (id)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet;

- (NSArray *)symbols;

@end
