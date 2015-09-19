//
//  NSString+FXExtensions.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/31/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FXAlphabet;

@interface NSString (FXExtensions)

+ (id)randomString;
+ (id)randomStringWithLength:(NSUInteger)length;
+ (id)randomStringWithLength:(NSUInteger)length alphabet:(FXAlphabet *)alphabet;

- (NSArray *)symbols;

@end
