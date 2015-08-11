//
//  FXEmployee.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FXObservableObject.h"
#import "FXMoneyFlow.h"

typedef enum {
	kFXEmployeeIsReady,
	kFXEmployeeStartedWork,
	kFXEmployeeFinishedWork
} FXEmployeeState;

@class FXEmployee;

@protocol FXEmployeeObserver <NSObject>
@optional
- (void)employeeIsReady:(FXEmployee *)employee;
- (void)employeeDidStartedWork:(FXEmployee *)employee;
- (void)employeeDidFinishedWork:(FXEmployee *)employee;

@end

@interface FXEmployee : FXObservableObject <FXMoneyFlow, FXEmployeeObserver>
@property (nonatomic, assign)	NSInteger	wallet;
@property (nonatomic, assign)	BOOL		busy;
@property (nonatomic, assign)	FXEmployeeState		state;

- (SEL)selectorForState:(FXEmployeeState)state;

- (void)performEmployeeSpecificJobForMoney:(NSInteger)money fromObject:(id<FXMoneyFlow>)object;

@end
