//
//  FXArrayModelChanges+UITableView.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/5/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXArrayModelChanges+UITableView.h"

@implementation FXArrayModelChanges (UITableView)

- (void)applyToTableView:(UITableView *)tableView {
	[self applyToTableView:tableView rowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)applyToTableView:(UITableView *)tableView rowAnimation:(UITableViewRowAnimation)rowAnimation {
	// intended to be reloaded in subclasses
}

@end

@implementation FXArrayModelChangesOneIndex (UITableView)

- (void)applyToTableView:(UITableView *)tableView rowAnimation:(UITableViewRowAnimation)rowAnimation {
	switch (self.state) {
		case kFXArrayModelChangesAdding: {
			[tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:self.indexPath]
							 withRowAnimation:rowAnimation];
#if __IPHONE_OS_VERSION_MAX_ALLOWED < 80000
			[tableView reloadRowsAtIndexPaths:[tableView indexPathsForVisibleRows] 
							 withRowAnimation:UITableViewRowAnimationNone];
#endif
		}
			break;
			
		case kFXArrayModelChangesRemoving: {
			[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:self.indexPath]
							 withRowAnimation:rowAnimation];
		}
			break;
			
		default:
			break;
	}
}

@end

@implementation FXArrayModelChangesTwoIndices (UITableView)

- (void)applyToTableView:(UITableView *)tableView rowAnimation:(UITableViewRowAnimation)rowAnimation {
	[tableView moveRowAtIndexPath:self.fromIndexPath toIndexPath:self.toIndexPath];
}

@end
