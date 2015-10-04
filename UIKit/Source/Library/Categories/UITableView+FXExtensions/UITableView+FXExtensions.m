//
//  UITableView+FXExtensions.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/22/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "UITableView+FXExtensions.h"

#import "FXArrayModelChanges.h"
#import "FXArrayModelChangesOneIndex.h"
#import "FXArrayModelChangesTwoIndices.h"

#import "UINib+FXExtensions.h"

@implementation UITableView (FXExtensions)

#pragma mark -
#pragma mark Public Methods

- (id)dequeueReusableCellWithClass:(Class)aClass {
	id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(aClass)];
	if (!cell) {
		cell = [UINib objectWithClass:aClass];
	}
	
	return cell;
}

- (NSInteger)numberOfRows {
	return [self numberOfRowsInSection:0];
}

- (void)updateWithChanges:(id)changes {
	NSIndexPath *atIndexPath = nil;
	NSIndexPath *toIndexPath = nil;
	
	if ([changes isMemberOfClass:[FXArrayModelChangesOneIndex class]]) {
		atIndexPath = [changes indexPath];
	} else if ([changes isMemberOfClass:[FXArrayModelChangesTwoIndices class]]) {
		atIndexPath = [changes fromIndexPath];
		toIndexPath = [changes toIndexPath];
	}
	
	switch ([changes state]) {
		case kFXArrayModelChangesAdding: {
			[self insertRowsAtIndexPaths:[NSArray arrayWithObject:atIndexPath] 
						withRowAnimation:UITableViewRowAnimationAutomatic];
		}
			break;
			
		case kFXArrayModelChangesRemoving: {
			[self deleteRowsAtIndexPaths:[NSArray arrayWithObject:atIndexPath] 
						withRowAnimation:UITableViewRowAnimationAutomatic];
		}
			break;
			
		case kFXArrayModelChangesMoving: {
			[self moveRowAtIndexPath:atIndexPath toIndexPath:toIndexPath];
		}
			break;
			
		default:
			break;
	}
}

@end
