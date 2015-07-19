//
//  FXBuilding.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

//@class FXRoom;

@interface FXBuilding : NSObject
@property (nonatomic, retain) NSMutableArray *rooms;

- (id)initWithRooms:(NSArray *)rooms;
- (void)addRoom:(id)room;
- (void)removeRoom:(id)room;

@end
