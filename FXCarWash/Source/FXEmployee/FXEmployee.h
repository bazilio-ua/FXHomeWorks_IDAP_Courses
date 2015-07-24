//
//  FXEmployee.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FXMoneyFlow.h"

@interface FXEmployee : NSObject <FXMoneyFlow>
@property (nonatomic, assign)	NSInteger	wallet;

+ (id)employee;

- (void)performEmployeeSpecificJobForMoney:(NSInteger)money fromObject:(id<FXMoneyFlow>)object;

@end
