//
//  FXDataViewController.m
//  FXDataView
//
//  Created by Basil Nikityuk on 9/19/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXDataViewController.h"

#import "FXDataView.h"
#import "FXDataCell.h"

#import "FXDataModel.h"
#import "FXArrayModel.h"

#import "UINib+FXExtensions.h"
#import "UITableView+FXExtensions.h"
#import "NSIndexPath+FXExtensions.h"

#import "FXMacros.h"

FXViewControllerMainViewProperty(FXDataViewController, dataView, FXDataView);

@implementation FXDataViewController

@synthesize arrayModel	= _arrayModel;

#pragma mark -
#pragma mark User Interactions

- (IBAction)onTapAddButton:(id)sender {
	NSLog(@"Add");

	[self.arrayModel addObject:[FXDataModel new]];
	[self.dataView.tableView reloadData];
	
	NSLog(@"%@", self.arrayModel.array); // DEBUG
}

- (IBAction)onTapRemoveButton:(id)sender {
	NSLog(@"Remove");
	
	FXArrayModel *arrayModel = self.arrayModel;
	UITableView *tableView = self.dataView.tableView;
	NSIndexPath *selectedIndexPath = [tableView indexPathForSelectedRow];
	NSUInteger selectedRow = selectedIndexPath.row;
	if (selectedRow < [arrayModel count]) {
		[arrayModel removeObjectAtIndex:selectedRow];
	}
	
	[tableView reloadData];
	
	NSLog(@"%@", arrayModel.array); // DEBUG
}

- (IBAction)onTapEditButton:(id)sender {
	NSLog(@"Edit");
	
	FXDataView *dataView = self.dataView;
	dataView.editing = !dataView.editing;
}

#pragma mark -
#pragma mark View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self.dataView.tableView reloadData];
	
	NSLog(@"%@", self.arrayModel.array); // DEBUG
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
	return [self.arrayModel count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	FXDataCell *cell = [tableView dequeueReusableCellWithClass:[FXDataCell class]];
	cell.model = [self.arrayModel objectAtIndex:indexPath.row];
	
	NSLog(@"row: %d", indexPath.row); // DEBUG
	
	return cell;
}

- (void)  tableView:(UITableView *)tableView 
 commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
  forRowAtIndexPath:(NSIndexPath *)indexPath 
{
	FXArrayModel *arrayModel = self.arrayModel;
	NSArray *indexPathArray = [NSArray arrayWithObject:indexPath];
	if (UITableViewCellEditingStyleInsert == editingStyle) {
		[arrayModel insertObjectAtIndex:[FXDataModel new] index:indexPath.row];
		[tableView insertRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationAutomatic];
	} else if (UITableViewCellEditingStyleDelete == editingStyle) {
		[arrayModel removeObjectAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationAutomatic];
	} 
}

- (void)  tableView:(UITableView *)tableView 
 moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath 
		toIndexPath:(NSIndexPath *)destinationIndexPath 
{
	[self.arrayModel moveObjectAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
	
	NSLog(@"%@", self.arrayModel.array); // DEBUG
}

#pragma mark -
#pragma mark UITableViewDelegate protocol

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView 
		   editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	UITableViewCellEditingStyle editingStyle = UITableViewCellEditingStyleDelete;
	if (indexPath.row == [self.arrayModel count] - 1) {
		editingStyle = UITableViewCellEditingStyleInsert;
	}
	
	return editingStyle;
}

@end
