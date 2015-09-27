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
#import "FXDataArrayModel.h"

#import "UINib+FXExtensions.h"
#import "UITableView+FXExtensions.h"
#import "NSIndexPath+FXExtensions.h"

@interface FXDataViewController ()
@property (nonatomic, readonly)	FXDataView	*dataView;

@end

@implementation FXDataViewController

@synthesize dataArrayModel	= _dataArrayModel;

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

	[self.dataArrayModel addObject:[FXDataModel new]];
	[self.dataView.tableView reloadData];
	
	NSLog(@"%@", self.dataArrayModel.dataArray); // DEBUG
}

- (IBAction)onTapRemoveButton:(id)sender {
	NSLog(@"Remove");
	
	NSIndexPath *selectedIndexPath = [self.dataView.tableView indexPathForSelectedRow];
	[self.dataArrayModel removeObjectAtIndex:selectedIndexPath.row];
	[self.dataView.tableView reloadData];
	
	NSLog(@"%@", self.dataArrayModel.dataArray); // DEBUG
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
	
	NSLog(@"%@", self.dataArrayModel.dataArray); // DEBUG
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
	cell.dataModel = [self.dataArrayModel objectAtIndex:indexPath.row];
	
	NSLog(@"row: %d", indexPath.row); // DEBUG
	
	return cell;
}

- (void)  tableView:(UITableView *)tableView 
 commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
  forRowAtIndexPath:(NSIndexPath *)indexPath 
{
	FXDataArrayModel *dataArrayModel = self.dataArrayModel;
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
	[self.dataArrayModel moveObjectAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
	
	NSLog(@"%@", self.dataArrayModel.dataArray); // DEBUG
}

#pragma mark -
#pragma mark UITableViewDelegate protocol

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView 
		   editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	UITableViewCellEditingStyle editingStyle = UITableViewCellEditingStyleDelete;
	if (indexPath.row == [self.dataArrayModel count] - 1) {
		editingStyle = UITableViewCellEditingStyleInsert;
	}
	
	return editingStyle;
}

@end
