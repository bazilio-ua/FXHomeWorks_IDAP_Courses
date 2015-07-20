//
//  FXRoomWashBox.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/19/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXRoom.h"

@interface FXRoomWashBox : FXRoom
@property (nonatomic, retain) 						NSMutableArray	*cars;
@property (nonatomic, assign, getter = isFreeBox)	BOOL			freebox;

- (void)addCar:(id)car;
- (void)removeCar:(id)car;
- (BOOL)isFreeBox;

@end
