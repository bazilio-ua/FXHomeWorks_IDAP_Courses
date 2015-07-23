//
//  FXMoneyFlow.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FXMoneyFlow <NSObject>
//@property (nonatomic, assign) NSInteger wallet;

@optional
- (BOOL)ableToPayMoney:(NSInteger)money; // need for car only
- (NSInteger)getEarningsAmountFromEmployee:(id<FXMoneyFlow>)employee; // 
@required
- (void)receiveMoney:(NSInteger)money fromPayer:(id<FXMoneyFlow>)payer;
@optional
- (void)sendMoney:(NSInteger)money toPayee:(id<FXMoneyFlow>)payee;

//@optional
//- (BOOL)ableToGetMoney:(NSInteger)money fromPayer:(id<FXMoneyFlow>)payer;
//- (void)receiveMoney:(NSInteger)money fromPayer:(id<FXMoneyFlow>)payer;
//- (void)sendMoney:(NSInteger)money toPayee:(id<FXMoneyFlow>)payee;

@end
