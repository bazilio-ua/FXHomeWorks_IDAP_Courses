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

- (id)cellWithClass:(Class)aClass {
	return [self cellWithClass:aClass 
						bundle:nil 
						 owner:nil 
					   options:nil];
}

- (id)cellWithClass:(Class)aClass 
			 bundle:(NSBundle *)bundle 
			  owner:(id)owner 
			options:(NSDictionary *)options 
{
	id cell = [self dequeueReusableCellWithClass:aClass];
	if (nil == cell) {
		cell = [UINib objectWithClass:aClass 
							   bundle:bundle 
								owner:owner 
							  options:options];
	}
	
	return cell;
}

- (id)dequeueReusableCellWithClass:(Class)aClass {
	return [self dequeueReusableCellWithIdentifier:NSStringFromClass(aClass)];
}

@end
