//
//  FXView.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/12/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXView.h"

#import "FXLoadingView.h"

@implementation FXView

@synthesize loadingView = _loadingView;

@dynamic loadingViewVisible;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	self.loadingView = nil;
}

#pragma mark - 
#pragma mark Accessors

- (BOOL)isLoadingViewVisible {
	return self.loadingView.visible;
}

#pragma mark -
#pragma mark View lifecycle

- (void)awakeFromNib {
	[super awakeFromNib];
	
	[self connectLoadingView];
}

#pragma mark - 
#pragma mark Public Methods

- (void)connectLoadingView {
	self.loadingView = [FXLoadingView viewWithSuperview:self];
}

- (void)showLoadingView {
	self.loadingView.visible = YES;
}

- (void)hideLoadingView {
	self.loadingView.visible = NO;
}

@end
