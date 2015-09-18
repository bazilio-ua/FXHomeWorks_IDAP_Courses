//
//  FXViewController.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/8/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FXSquareModel;

@interface FXSquareViewController : UIViewController
@property (nonatomic, strong)	FXSquareModel	*squareModel;

- (IBAction)onMoveButton:(id)sender;
- (IBAction)onCyclicMoveButton:(id)sender;

@end
