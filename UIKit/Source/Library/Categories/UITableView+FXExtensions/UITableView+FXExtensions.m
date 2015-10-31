//
//  UITableView+FXExtensions.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/22/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "UITableView+FXExtensions.h"

#import "FXArrayModelChanges.h"
#import "FXArrayModelChangesOneIndex.h"
#import "FXArrayModelChangesTwoIndices.h"

#import "UINib+FXExtensions.h"
#import "FXArrayModelChanges+UITableView.h"

@implementation UITableView (FXExtensions)

#pragma mark -
#pragma mark Public Methods

- (id)dequeueReusableCellWithClass:(Class)aClass {
	id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(aClass)];
	if (!cell) {
		cell = [UINib objectWithClass:aClass];
	}
	
	return cell;
}

- (NSInteger)numberOfRows {
	return [self numberOfRowsInSection:0];
}

- (void)updateWithChanges:(id)changes {
	[self updateWithChanges:changes rowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)updateWithChanges:(id)changes rowAnimation:(UITableViewRowAnimation)rowAnimation {
	[self beginUpdates];
	
	[changes applyToTableView:self rowAnimation:rowAnimation];
	
	[self endUpdates];
}

@end
