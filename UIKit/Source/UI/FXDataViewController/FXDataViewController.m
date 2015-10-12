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
#import "FXArrayModelChanges.h"

#import "UINib+FXExtensions.h"
#import "UITableView+FXExtensions.h"
#import "NSIndexPath+FXExtensions.h"

#import "FXMacros.h"

FXViewControllerMainViewProperty(FXDataViewController, dataView, FXDataView);

@implementation FXDataViewController

@synthesize arrayModel	= _arrayModel;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	self.arrayModel = nil;
}

#pragma mark - 
#pragma mark Accessors

- (void)setArrayModel:(FXArrayModel *)arrayModel {
	if (_arrayModel != arrayModel) {
		[_arrayModel removeObserver:self];
		_arrayModel = arrayModel;
		[_arrayModel addObserver:self];
	}
}

#pragma mark -
#pragma mark User Interactions

- (IBAction)onAddButton:(id)sender {
	NSLog(@"Add");

	[self.arrayModel addObject:[FXDataModel new]];
	
	NSLog(@"%@", self.arrayModel.array); // DEBUG
}

- (IBAction)onRemoveButton:(id)sender {
	NSLog(@"Remove");
	
	NSIndexPath *selectedIndexPath = [self.dataView.tableView indexPathForSelectedRow];
	[self.arrayModel removeObjectAtIndex:selectedIndexPath.row];
	
	NSLog(@"%@", self.arrayModel.array); // DEBUG
}

- (IBAction)onEditButton:(id)sender {
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
	
	return cell;
}

- (void)  tableView:(UITableView *)tableView 
 commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
  forRowAtIndexPath:(NSIndexPath *)indexPath 
{
	FXArrayModel *arrayModel = self.arrayModel;
	if (UITableViewCellEditingStyleInsert == editingStyle) {
		[arrayModel insertObjectAtIndex:[FXDataModel new] index:indexPath.row];
	} else if (UITableViewCellEditingStyleDelete == editingStyle) {
		[arrayModel removeObjectAtIndex:indexPath.row];
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
	if (indexPath.row == [tableView numberOfRows] - 1) {
		editingStyle = UITableViewCellEditingStyleInsert;
	}
	
	return editingStyle;
}

#pragma mark -
#pragma mark FXModelObserver protocol

- (void)model:(FXArrayModel *)model didChangeWithChanges:(FXArrayModelChanges *)changes {
	NSLog(@"model:didChangeWithChanges: %@", changes);
	[self.dataView.tableView updateWithChanges:changes];
}

@end
