//
//  FXDataViewController.h
//  FXDataView
//
//  Created by Basil Nikityuk on 9/19/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FXDataModel;
@class FXDataArrayModel;

@interface FXDataViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)	FXDataArrayModel	*dataArrayModel;

- (IBAction)onTapAddButton:(id)sender;
- (IBAction)onTapRemoveButton:(id)sender;
- (IBAction)onTapEditButton:(id)sender;

@end
