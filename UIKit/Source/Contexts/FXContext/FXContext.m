//
//  FXContext.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXContext.h"

#import "FXUserModel.h"

@interface FXContext ()
@property (nonatomic, strong)	FXUserModel		*model;

@end

@implementation FXContext

#pragma mark -
#pragma mark Class Methods

+ (id)contextWithModel:(FXUserModel *)model {
	return [[self alloc] initWithModel:model];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)initWithModel:(FXUserModel *)model {
	self = [super init];
	if (self) {
		self.model = model;
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)execute {
	
}

- (void)cancel {
	
}

- (void)parseWithResult:(id)result error:(NSError *)error {
	
}

@end
