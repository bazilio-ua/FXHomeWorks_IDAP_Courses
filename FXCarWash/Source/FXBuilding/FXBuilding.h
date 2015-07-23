//
//  FXBuilding.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FXBuilding : NSObject
@property (nonatomic, copy, readonly)	NSArray	*rooms;

+ (id)building;

- (void)addRoom:(id)room;
- (void)removeRoom:(id)room;

@end
