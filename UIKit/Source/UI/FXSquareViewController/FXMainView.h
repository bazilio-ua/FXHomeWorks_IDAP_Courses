//
//  FXMainView.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/9/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FXSquareView;

@interface FXMainView : UIView
@property (nonatomic, strong)	IBOutlet	FXSquareView	*squareFrame;
@property (nonatomic, strong)	IBOutlet	UIButton		*moveButton;
@property (nonatomic, strong)	IBOutlet	UIButton		*cyclicMoveButton;

- (void)updateCyclicMoveButtonTitle;

@end
