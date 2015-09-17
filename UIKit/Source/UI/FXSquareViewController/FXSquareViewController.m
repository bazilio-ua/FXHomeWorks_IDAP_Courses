//
//  FXViewController.m
//  UIKit
//
//  Created by Basil Nikityuk on 9/8/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXSquareViewController.h"

#import "FXMainView.h"
#import "FXSquareView.h"

@interface FXSquareViewController ()
@property (nonatomic, readonly)	FXMainView	*mainView;

@end

@implementation FXSquareViewController

@synthesize squareModel = _squareModel;
@dynamic mainView;

#pragma mark -
#pragma mark Accessors

- (FXMainView *)mainView {
	if ([self isViewLoaded] && [self.view isKindOfClass:[FXMainView class]]) {
		return (FXMainView *)self.view;
	}
	
	return nil;
}

#pragma mark -
#pragma mark User Interactions

- (IBAction)onMoveButton:(id)sender {
	NSLog(@"Move button pressed");
	
	[self.mainView.squareView moveSquareToNextPosition];
}

- (IBAction)onCyclicMoveButton:(id)sender {
	NSLog(@"Cyclic Move button pressed");
	
	FXMainView *mainView = self.mainView;
	FXSquareView *squareView = mainView.squareView;
	
	squareView.cyclicMoving = !squareView.cyclicMoving;
	NSLog(@"isCyclicMoving=%d", [squareView isCyclicMoving]);
	[mainView updateCyclicMoveButtonTitle];
	
	[squareView cyclicMoveSquareToNextPosition];
}

#pragma mark - 
#pragma mark View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.mainView.squareView.squareModel = self.squareModel;
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
