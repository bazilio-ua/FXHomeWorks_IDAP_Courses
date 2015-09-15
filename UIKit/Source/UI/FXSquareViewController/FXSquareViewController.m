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

- (void)moveSquareToNextPosition;

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
	
	[self moveSquareToNextPosition];
}

- (IBAction)onCyclicMoveButton:(id)sender {
	NSLog(@"Cyclic Move button pressed");
	
	FXMainView *mainView = self.mainView;
	FXSquareView *squareView = mainView.squareView;
	squareView.cyclicMove = !squareView.cyclicMove;
	NSLog(@"isCyclicMove=%d", squareView.isCyclicMove);
	[mainView updateCyclicMoveButtonTitle];
	
	[self moveSquareToNextPosition];
}

#pragma mark -
#pragma mark Private Methods

- (void)moveSquareToNextPosition {
	FXSquareModel *squareModel = self.squareModel;
	FXSquareView *squareView = self.mainView.squareView;
	
	squareView.squareModel = squareModel;
	FXSquarePosition position = [squareModel nextPosition];
	
	if (squareView.isCyclicMove) {
		[squareView setSquarePosition:position 
							 animated:YES 
					 completionHanler:^(BOOL finished) {
						 if (finished) {
							 [self moveSquareToNextPosition];
						 }
					 }];
	} else {
		[squareView setSquarePosition:position 
							 animated:YES];
	}
}

#pragma mark - 
#pragma mark View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
