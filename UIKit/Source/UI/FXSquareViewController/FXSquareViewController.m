//
//  FXSquareViewController.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/8/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXSquareViewController.h"

#import "FXSquareView.h"

#import "FXMacros.h"

FXViewControllerMainViewProperty(FXSquareViewController, squareView, FXSquareView);

@implementation FXSquareViewController

@synthesize squareModel = _squareModel;

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
}

#pragma mark - 
#pragma mark View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.squareView.squareModel = self.squareModel;
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
