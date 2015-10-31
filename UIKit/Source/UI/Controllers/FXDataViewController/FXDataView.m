//
//  FXDataView.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXDataView.h"

static NSString * const kFXEditButtonTitleEdit 	= @"Edit";
static NSString * const kFXEditButtonTitleDone 	= @"Done";

@interface FXDataView ()

- (void)updateEditButtonTitle;

@end

@implementation FXDataView

@synthesize tableView		= _tableView;
@synthesize addButton		= _addButton;
@synthesize removeButton	= _removeButton;
@synthesize editButton		= _editButton;

@dynamic editing;

#pragma mark - 
#pragma mark Accessors

- (void)setEditing:(BOOL)editing {
	[self.tableView setEditing:editing animated:YES];
	
	[self updateEditButtonTitle];
}

- (BOOL)isEditing {
	return self.tableView.editing;
}

#pragma mark -
#pragma mark Private Methods

- (void)updateEditButtonTitle {
	NSString *title = [self isEditing] ? kFXEditButtonTitleDone : kFXEditButtonTitleEdit;
	[self.editButton setTitle:title
					 forState:UIControlStateNormal];
}

@end
