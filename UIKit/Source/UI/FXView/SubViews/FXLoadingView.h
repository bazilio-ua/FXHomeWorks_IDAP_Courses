//
//  FXLoadingView.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/12/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FXLoadingView : UIView
@property (nonatomic, readonly, getter = isVisible)	BOOL	visible;

+ (id)viewWithView:(UIView *)view;

- (id)initWithView:(UIView *)view;

- (void)setVisible:(BOOL)visible;
- (void)setVisible:(BOOL)visible animated:(BOOL)animated;
- (void)setVisible:(BOOL)visible animated:(BOOL)animated completion:(void (^)(void))completion;

@end
