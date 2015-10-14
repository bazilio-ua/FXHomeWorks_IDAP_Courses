//
//  FXLoadingView.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/12/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXLoadingView.h"

#import "UINib+FXExtensions.h"

static const NSTimeInterval kFXLoadViewAnimationDuration	= 5;
static const CGFloat		kFXLoadViewVisibilityAlpha		= 0.7f;

@interface FXLoadingView ()
@property (nonatomic, assign)	BOOL	visible;

@end

@implementation FXLoadingView

@synthesize visible = _visible;

#pragma mark -
#pragma mark Class Methods

+ (id)viewWithView:(UIView *)view {
	return [[self alloc] initWithView:view];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)initWithView:(UIView *)view {
	self = [super init];
	if (self) {
		self = [UINib objectWithClass:[self class]];
		
		[view addSubview:self];
		
		self.frame = view.superview.bounds;// view.bounds; // FIXME
	}
	
	return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setVisible:(BOOL)visible {
	[self setVisible:visible animated:YES];
}

- (void)setVisible:(BOOL)visible animated:(BOOL)animated {
	[self setVisible:visible animated:animated completion:nil];
}

- (void)setVisible:(BOOL)visible animated:(BOOL)animated completion:(void (^)(void))completion {
	NSTimeInterval duration = animated ? kFXLoadViewAnimationDuration : 0;
	CGFloat alpha = animated ? kFXLoadViewVisibilityAlpha : 0;
	[UIView animateWithDuration:duration 
					 animations:^{
						 self.alpha = alpha;
					 } completion:^(BOOL finished) {
						 self.visible = visible;
						 if (completion) {
							 completion();
						 }
					 }];
}

@end
