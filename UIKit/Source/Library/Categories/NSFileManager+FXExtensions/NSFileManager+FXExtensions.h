//
//  NSFileManager+FXExtensions.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/15/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (FXExtensions)

+ (NSString *)userDocumentsPath;

+ (NSString *)pathWithSearchPathDirectory:(NSSearchPathDirectory)pathDirectory;
+ (NSString *)pathWithSearchPathDirectory:(NSSearchPathDirectory)pathDirectory 
							   domainMask:(NSSearchPathDomainMask)domainMask;

@end
