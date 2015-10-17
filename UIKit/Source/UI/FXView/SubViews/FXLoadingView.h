//
//  FXLoadingView.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/12/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FXLoadingView : UIView
@property (nonatomic, assign, getter = isVisible)	BOOL	visible;

+ (id)viewWithSuperview:(UIView *)superview;

- (id)initWithSuperview:(UIView *)superview;

- (void)setVisible:(BOOL)visible animated:(BOOL)animated;
- (void)setVisible:(BOOL)visible animated:(BOOL)animated completion:(void (^)(void))completion;

@end
