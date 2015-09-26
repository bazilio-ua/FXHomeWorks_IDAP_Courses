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
	NSLog(@"row: %d", indexPath.row);
	cell.dataModel = [self.dataArrayModel objectAtIndex:indexPath.row];
	
	return cell;
}

- (void)  tableView:(UITableView *)tableView 
 commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
  forRowAtIndexPath:(NSIndexPath *)indexPath 
{
	FXDataArrayModel *dataArrayModel = self.dataArrayModel;
	NSArray *indexPathArray = [NSArray arrayWithObject:indexPath];
	if (UITableViewCellEditingStyleInsert == editingStyle) {
		NSIndexPath *insertIndexPath = [NSIndexPath indexPathForRow:[dataArrayModel count] inSection:0];
		[dataArrayModel addObject:[FXDataModel new]];
		[tableView insertRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationAutomatic];
		[tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:insertIndexPath] 
						 withRowAnimation:UITableViewRowAnimationMiddle];
	} else if (UITableViewCellEditingStyleDelete == editingStyle) {
		[dataArrayModel removeObjectAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationAutomatic];
	} 
}

- (void)  tableView:(UITableView *)tableView 
 moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath 
		toIndexPath:(NSIndexPath *)destinationIndexPath 
{
	
}

#pragma mark -
#pragma mark UITableViewDelegate protocol

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView 
		   editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	if (indexPath.row == [self.dataArrayModel count] - 1) {
		return UITableViewCellEditingStyleInsert; //fixme -- instead 'add' button
	} else {
		return UITableViewCellEditingStyleDelete;
	}
}

@end
