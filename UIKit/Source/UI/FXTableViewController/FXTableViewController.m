//
//  FXTableViewController.m
//  FXTableView
//
//  Created by Basil Nikityuk on 9/19/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXTableViewController.h"

#import "FXTableView.h"
#import "FXDataCell.h"

#import "FXDataModel.h"
#import "FXDataArrayModel.h"

#import "UINib+FXExtensions.h"
#import "UITableView+FXExtensions.h"

@interface FXTableViewController ()
@property (nonatomic, readonly)	FXTableView	*tableView;

@end

@implementation FXTableViewController

@synthesize dataModel		= _dataModel;
@synthesize dataArrayModel	= _dataArrayModel;

@dynamic tableView;

#pragma mark -
#pragma mark Accessors

- (FXTableView *)tableView {
	if ([self isViewLoaded] && [self.view isKindOfClass:[FXTableView class]]) {
		return (FXTableView *)self.view;
	}
	
	return nil;
}

#pragma mark -
#pragma mark User Interactions

- (IBAction)onTapAddButton:(id)sender {
	NSLog(@"Add");

	[self.dataArrayModel addObject:[FXDataModel new]];
	[self.tableView.tableView reloadData];
}

- (IBAction)onTapRemoveButton:(id)sender {
	NSLog(@"Remove");
}

- (IBAction)onTapEditButton:(id)sender {
	NSLog(@"Edit");
	
	FXTableView *tableView = self.tableView;
	tableView.editing = !tableView.editing;
}

#pragma mark -
#pragma mark View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self.tableView.tableView reloadData];
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
	return [self.dataArrayModel count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	FXDataCell *cell = [tableView dequeueReusableCellWithClass:[FXDataCell class]];
	cell.dataModel = [self.dataArrayModel objectAtIndexedSubscript:indexPath.row];
	
	return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate protocol

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
}

@end
