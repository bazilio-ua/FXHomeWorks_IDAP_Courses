//
//  FXEmployee.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FXObservable.h"
#import "FXMoneyFlow.h"

typedef enum {
	kFXEmployeeIsReady,
	kFXEmployeeStartedWork,
	kFXEmployeeFinishedWork
} FXEmployeeState;

@class FXEmployee;

@protocol FXEmployeeObserver <NSObject>
@optional
@property (nonatomic, assign)	FXEmployeeState		state;
- (void)employeeIsReady:(FXEmployee *)employee;
- (void)employeeDidStartedWork:(FXEmployee *)employee;
- (void)employeeDidFinishedWork:(FXEmployee *)employee;

@end

@interface FXEmployee : FXObservable <FXMoneyFlow, FXEmployeeObserver>
@property (nonatomic, assign)	NSInteger	wallet;

- (SEL)selectorForState:(FXEmployeeState)state;

- (void)processObject:(id<FXMoneyFlow, FXEmployeeObserver>)object;
- (void)performEmployeeSpecificJobWithObject:(id<FXMoneyFlow, FXEmployeeObserver>)object;
- (void)performEmployeeSpecificJobWithObjectInBackground:(id<FXMoneyFlow, FXEmployeeObserver>)object;
- (void)finishEmployeeSpecificJobWithObjectOnMainThread:(id<FXMoneyFlow, FXEmployeeObserver>)object;

@end
