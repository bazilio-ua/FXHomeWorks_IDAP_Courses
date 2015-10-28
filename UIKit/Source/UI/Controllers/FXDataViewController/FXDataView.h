//
//  FXDataView.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FXView.h"

@interface FXDataView : FXView
@property (nonatomic, strong)	IBOutlet	UITableView	*tableView;
@property (nonatomic, strong)	IBOutlet	UIButton	*addButton;
@property (nonatomic, strong)	IBOutlet	UIButton	*removeButton;
@property (nonatomic, strong)	IBOutlet	UIButton	*editButton;

@property (nonatomic, assign, getter = isEditing)	BOOL	editing;

@end
