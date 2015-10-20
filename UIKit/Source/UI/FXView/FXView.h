//
//  FXView.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/12/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FXLoadingView;

@interface FXView : UIView
@property (nonatomic, strong)	FXLoadingView	*loadingView;
@property (nonatomic, readonly, getter = isLoadingViewVisible)	BOOL	loadingViewVisible;

- (void)connectLoadingView;
- (void)showLoadingView;
- (void)hideLoadingView;

@end
