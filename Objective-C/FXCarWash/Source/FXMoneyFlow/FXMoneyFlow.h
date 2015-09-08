//
//  FXMoneyFlow.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FXMoneyFlow <NSObject>
@property (nonatomic, assign)	NSInteger	money;

@required
- (BOOL)ableToPayMoney:(NSInteger)money;
@optional
- (void)receiveMoney:(NSInteger)money fromPayer:(id<FXMoneyFlow>)payer;
- (void)sendMoney:(NSInteger)money toPayee:(id<FXMoneyFlow>)payee;
- (NSInteger)earningAmount;

@end
