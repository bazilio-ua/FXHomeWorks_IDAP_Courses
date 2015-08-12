//
//  FXDirector.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/19/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXDirector.h"

@implementation FXDirector

#pragma mark -
#pragma mark Public Methods

- (void)performEmployeeSpecificJobForMoney:(NSInteger)money fromObject:(id<FXMoneyFlow>)object {
	if (0 < [object earningsAmount]) {
		[super performEmployeeSpecificJobForMoney:money fromObject:object];
		
		NSLog(@"Director: %@ make a profit %ld money from Accountant: %@", self, money, object);
	} else {
		NSLog(@"Director: %@ there is no profit", self);
	}
}

@end
