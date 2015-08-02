//
//  FXAlphabets.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/31/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FXAlphabets : NSObject

+ (id)alphabetWithSymbols:(NSString *)symbols;
+ (id)alphabetWithStrings:(NSArray *)strings;
+ (id)alphabetWithRange:(NSRange)range;
+ (id)alphabetWithAlphabets:(NSArray *)alphabets;

- (id)initWithSymbols:(NSString *)symbols;
- (id)initWithStrings:(NSArray *)strings;
- (id)initWithRange:(NSRange)range;
- (id)initWithAlphabets:(NSArray *)alphabets;

- (NSUInteger)count;

- (NSString *)stringAtIndex:(NSUInteger)index;

@end
