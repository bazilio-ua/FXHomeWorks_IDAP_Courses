//
//  FXTableView.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXTableView.h"

@implementation FXTableView

@synthesize tableView		= _tableView;
@synthesize addButton		= _addButton;
@synthesize removeButton	= _removeButton;
@synthesize editButton		= _editButton;

@dynamic editing;

#pragma mark - 
#pragma mark Accessors

- (void)setEditing:(BOOL)editing {
	[self.tableView setEditing:editing animated:YES];
}

- (BOOL)isEditing {
	return self.tableView.editing;
}

@end
