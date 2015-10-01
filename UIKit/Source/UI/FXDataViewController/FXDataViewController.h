//
//  FXDataViewController.h
//  FXDataView
//
//  Created by Basil Nikityuk on 9/19/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FXArrayModelObserver.h"

@class FXArrayModel;

@interface FXDataViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, FXArrayModelObserver>
@property (nonatomic, strong)	FXArrayModel	*arrayModel;

- (IBAction)onTapAddButton:(id)sender;
- (IBAction)onTapRemoveButton:(id)sender;
- (IBAction)onTapEditButton:(id)sender;

@end
