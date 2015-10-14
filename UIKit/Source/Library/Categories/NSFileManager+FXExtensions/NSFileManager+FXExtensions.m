//
//  NSFileManager+FXExtensions.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/15/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "NSFileManager+FXExtensions.h"

#import "NSArray+FXExtensions.h"

@implementation NSFileManager (FXExtensions)

#pragma mark -
#pragma mark Class Methods

+ (NSString *)userDocumentsPath {
	return [self pathWithSearchPathDirectory:NSDocumentDirectory domainMask:NSUserDomainMask];
}

+ (NSString *)pathWithSearchPathDirectory:(NSSearchPathDirectory)pathDirectory {
	return [self pathWithSearchPathDirectory:pathDirectory domainMask:NSUserDomainMask];
}

+ (NSString *)pathWithSearchPathDirectory:(NSSearchPathDirectory)pathDirectory 
							   domainMask:(NSSearchPathDomainMask)domainMask 
{
	return [NSSearchPathForDirectoriesInDomains(pathDirectory, domainMask, YES) firstObject];
}

@end
