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

@interface FXDataViewController ()
@property (nonatomic, readonly)	FXDataView	*dataView;

@end

@implementation FXDataViewController

@synthesize arrayModel	= _arrayModel;

@dynamic dataView;

#pragma mark -
#pragma mark Accessors

- (FXDataView *)dataView {
	if ([self isViewLoaded] && [self.view isKindOfClass:[FXDataView class]]) {
		return (FXDataView *)self.view;
	}
	
	return nil;
}

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
	
	NSIndexPath *selectedIndexPath = [self.dataView.tableView indexPathForSelectedRow];
	[self.arrayModel removeObjectAtIndex:selectedIndexPath.row];
	[self.dataView.tableView reloadData];
	
	NSLog(@"%@", self.arrayModel.array); // DEBUG
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
	cell.dataModel = [self.arrayModel objectAtIndex:indexPath.row];
	
	NSLog(@"row: %d", indexPath.row); // DEBUG
	
	return cell;
}

- (void)  tableView:(UITableView *)tableView 
 commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
  forRowAtIndexPath:(NSIndexPath *)indexPath 
{
	FXArrayModel *dataArrayModel = self.arrayModel;
	NSArray *indexPathArray = [NSArray arrayWithObject:indexPath];
	if (UITableViewCellEditingStyleInsert == editingStyle) {
		[dataArrayModel insertObjectAtIndex:[FXDataModel new] index:indexPath.row];
		[tableView insertRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationAutomatic];
	} else if (UITableViewCellEditingStyleDelete == editingStyle) {
		[dataArrayModel removeObjectAtIndex:indexPath.row];
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
