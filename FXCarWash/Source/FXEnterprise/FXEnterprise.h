//
//  FXEnterprise.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FXBuilding;

@interface FXEnterprise : NSObject
@property (nonatomic, copy, readonly)	NSArray	*buildings;

- (void)performWorkWithObject:(id)object;

@end
