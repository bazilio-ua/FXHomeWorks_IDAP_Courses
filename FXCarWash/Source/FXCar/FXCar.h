//
//  FXCar.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FXCar : NSObject
@property (nonatomic, assign)						float	money;
@property (nonatomic, assign, getter = isClean)		BOOL	clean;

- (id)initWithMoney:(float)money;
- (BOOL)doPayOff:(float)pay;

@end
