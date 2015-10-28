//
//  FXSquareView.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/9/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FXSquareModel.h"

@interface FXSquareView : UIView
@property (nonatomic, strong)	IBOutlet	UIView		*squareView;
@property (nonatomic, strong)	IBOutlet	UIButton	*moveButton;
@property (nonatomic, strong)	IBOutlet	UIButton	*cyclicMoveButton;

@property (nonatomic, strong)	FXSquareModel					*squareModel;

@property (nonatomic, assign, getter = isCyclicMoving)	BOOL	cyclicMoving;
@property (nonatomic, assign, getter = isAnimating)		BOOL	animating;

- (void)moveSquareToNextPosition;
- (void)cyclicMoveSquareToRandomPosition;

@end
