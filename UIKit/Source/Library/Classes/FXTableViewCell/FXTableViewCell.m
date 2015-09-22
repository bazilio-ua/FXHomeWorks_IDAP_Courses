//
//  FXTableViewCell.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/21/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXTableViewCell.h"

@implementation FXTableViewCell

#pragma mark -
#pragma mark Accessors

- (NSString *)reuseIdentifier {
	return NSStringFromClass([self class]);
}

@end
