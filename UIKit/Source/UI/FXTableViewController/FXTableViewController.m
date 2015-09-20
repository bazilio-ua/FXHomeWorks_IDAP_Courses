//
//  FXTableViewController.m
//  FXTableView
//
//  Created by Basil Nikityuk on 9/19/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXTableViewController.h"

#import "FXTableView.h"

@interface FXTableViewController ()
@property (nonatomic, readonly)	FXTableView	*tableView;

@end

@implementation FXTableViewController

@synthesize dataModel		= _dataModel;
@synthesize dataArrayModel	= _dataArrayModel;

@dynamic tableView;

#pragma mark -
#pragma mark User Interactions

- (IBAction)onTapAddButton:(id)sender {
	NSLog(@"Add");
}

- (IBAction)onTapRemoveButton:(id)sender {
	NSLog(@"Remove");
}

- (IBAction)onTapEditButton:(id)sender {
	NSLog(@"Edit");
}

#pragma mark -
#pragma mark View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -
#pragma mark UITableViewDataSource protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	return nil;
}

#pragma mark -
#pragma mark UITableViewDelegate protocol

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
}

@end
