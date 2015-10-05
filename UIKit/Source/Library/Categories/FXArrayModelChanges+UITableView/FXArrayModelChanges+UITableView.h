//
//  FXArrayModelChanges+UITableView.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/5/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXArrayModelChanges.h"
#import "FXArrayModelChangesOneIndex.h"
#import "FXArrayModelChangesTwoIndices.h"

@interface FXArrayModelChanges (UITableView)

- (void)applyToTableView:(UITableView *)tableView;
- (void)applyToTableView:(UITableView *)tableView rowAnimation:(UITableViewRowAnimation)rowAnimation;

@end

@interface FXArrayModelChangesOneIndex (UITableView)

- (void)applyToTableView:(UITableView *)tableView rowAnimation:(UITableViewRowAnimation)rowAnimation;

@end

@interface FXArrayModelChangesTwoIndices (UITableView)

- (void)applyToTableView:(UITableView *)tableView rowAnimation:(UITableViewRowAnimation)rowAnimation;

@end
