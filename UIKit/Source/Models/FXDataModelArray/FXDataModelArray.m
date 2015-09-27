//
//  FXDataModelArray.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/27/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXDataModelArray.h"

#import "FXDataModel.h"

@implementation FXDataModelArray

#pragma mark -
#pragma mark Class Methods

+ (id)arrayWithCount:(NSUInteger)count {
	return [[self alloc] initWithCount:count];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)initWithCount:(NSUInteger)count {
	self = [super init];
	if (self) {
		for (NSUInteger index = 0; index < count; index++) {
			[self addObject:[FXDataModel new]];
		}
	}
	
	return self;
}

@end
