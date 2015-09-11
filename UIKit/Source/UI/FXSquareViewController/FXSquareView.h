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
@property (nonatomic, strong)	FXSquareModel	*squareModel;

- (void)setSquarePosition:(FXSquarePosition)position;

- (void)setSquarePosition:(FXSquarePosition)position 
				 animated:(BOOL)animated;

- (void)setSquarePosition:(FXSquarePosition)position 
				 animated:(BOOL)animated 
		 completionHanler:(void (^)(BOOL finished))completion;

@end
