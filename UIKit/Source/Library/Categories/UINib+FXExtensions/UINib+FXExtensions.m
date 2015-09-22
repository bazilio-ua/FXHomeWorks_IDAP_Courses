//
//  UINib+FXExtensions.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/22/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "UINib+FXExtensions.h"

@implementation UINib (FXExtensions)

#pragma mark -
#pragma mark Class Methods

+ (UINib *)nibWithClass:(Class)aClass {
	return [self nibWithClass:aClass bundle:nil];
}

+ (UINib *)nibWithClass:(Class)aClass bundle:(NSBundle *)bundle {
	return [self nibWithNibName:NSStringFromClass(aClass) bundle:bundle];
}

+ (id)objectWithClass:(Class)aClass {
	return [self objectWithClass:aClass 
						  bundle:nil 
						   owner:nil 
						 options:nil];
}

+ (id)objectWithClass:(Class)aClass 
			   bundle:(NSBundle *)bundle 
				owner:(id)owner 
			  options:(NSDictionary *)options 
{
	UINib *nib = [self nibWithClass:aClass bundle:bundle];
	
	return [nib objectWithClass:aClass owner:owner options:options];
}

#pragma mark -
#pragma mark Public Methods

- (id)objectWithClass:(Class)aClass {
	return [self objectWithClass:aClass owner:nil options:nil];
}

- (id)objectWithClass:(Class)aClass 
				owner:(id)owner 
			  options:(NSDictionary *)options 
{
	NSArray *objects = [self instantiateWithOwner:owner options:options];
	for (id object in objects) {
		if ([object isMemberOfClass:aClass]) {
			return object;
		}
	}
	
	return nil;
}

@end
