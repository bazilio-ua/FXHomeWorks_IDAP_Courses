//
//  NSIndexPath+FXExtensions.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/27/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "NSIndexPath+FXExtensions.h"

@implementation NSIndexPath (FXExtensions)

#pragma mark -
#pragma mark Class Methods

+ (NSIndexPath *)indexPathForRow:(NSInteger)row {
	return [self indexPathForRow:row inSection:0];
}

@end
