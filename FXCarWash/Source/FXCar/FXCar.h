//
//  FXCar.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FXMoneyFlow.h"

@interface FXCar : NSObject <FXMoneyFlow>
@property (nonatomic, assign)					NSInteger	money;
@property (nonatomic, assign, getter = isClean)	BOOL		clean;

@end
