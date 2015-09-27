//
//  UITableView+FXExtensions.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/22/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "UITableView+FXExtensions.h"

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

@end