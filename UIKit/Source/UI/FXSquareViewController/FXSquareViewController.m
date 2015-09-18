//
//  FXViewController.m
//  UIKit
//
//  Created by Basil Nikityuk on 9/8/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXSquareViewController.h"

#import "FXSquareView.h"
#import "FXSquareFrame.h"

@interface FXSquareViewController ()
@property (nonatomic, readonly)	FXSquareView	*squareView;

@end

@implementation FXSquareViewController

@synthesize squareModel = _squareModel;
@dynamic squareView;

#pragma mark -
#pragma mark Accessors

- (FXSquareView *)squareView {
	if ([self isViewLoaded] && [self.view isKindOfClass:[FXSquareView class]]) {
		return (FXSquareView *)self.view;
	}
	
	return nil;
}

#pragma mark -
#pragma mark User Interactions

- (IBAction)onMoveButton:(id)sender {
	NSLog(@"Move button pressed");
	
	[self.squareView moveSquareToNextPosition];
}

- (IBAction)onCyclicMoveButton:(id)sender {
	NSLog(@"Cyclic Move button pressed");
	
	FXSquareView *squareView = self.squareView;
	
	squareView.cyclicMoving = !squareView.cyclicMoving;
	NSLog(@"isCyclicMoving=%d", [squareView isCyclicMoving]);
	[squareView updateCyclicMoveButtonTitle];
	
	[squareView cyclicMoveSquareToNextPosition];
}

#pragma mark - 
#pragma mark View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.squareView.squareFrame.squareModel = self.squareModel;
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
