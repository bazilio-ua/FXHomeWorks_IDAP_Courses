//
//  FXWashBox.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/19/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXRoom.h"

@interface FXWashBox : FXRoom
@property (nonatomic, copy, readonly)			NSArray		*cars;
@property (nonatomic, assign)					NSUInteger	carsCapacity;
@property (nonatomic, assign, getter = isFull)	BOOL		full;

- (void)addCar:(id)car;
- (void)removeCar:(id)car;

@end
