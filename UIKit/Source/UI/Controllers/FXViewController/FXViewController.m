//
//  FXViewController.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXViewController.h"

#import "FXContext.h"
#import "FXUserModel.h"

@interface FXViewController ()

@end

@implementation FXViewController

@dynamic contextClass;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	self.model = nil;
	self.context = nil;
}

#pragma mark -
#pragma mark Accessors

- (Class)contextClass {
	return nil;
}

- (void)setModel:(FXUserModel *)model {
	if (_model != model) {
		[_model removeObserver:self];
		_model = model;
		[_model addObserver:self];
		
		self.context = [self.contextClass contextWithModel:model];
	}
}

- (void)setContext:(FXContext *)context {
	if (_context != context) {
		[_context cancel];
		_context = context;
		[_context execute];
	}
}

@end
