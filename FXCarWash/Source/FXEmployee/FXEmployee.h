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
#import "FXEmployeeObserver.h"

typedef enum {
	kFXEmployeeIsReady,
	kFXEmployeeStartedWork,
	kFXEmployeeFinishedWork
} FXEmployeeState;

@interface FXEmployee : FXObservable <FXMoneyFlow, FXEmployeeObserver>
@property (nonatomic, assign)	NSInteger			wallet;
@property (nonatomic, assign)	FXEmployeeState		state;

- (SEL)selectorForState:(FXEmployeeState)state;

- (void)processObject:(id<FXMoneyFlow, FXEmployeeObserver>)object;
- (void)performEmployeeSpecificJobWithObject:(id<FXMoneyFlow, FXEmployeeObserver>)object;
- (void)performEmployeeSpecificJobWithObjectInBackground:(id<FXMoneyFlow, FXEmployeeObserver>)object;
- (void)finishEmployeeSpecificJobWithObjectOnMainThread:(id<FXMoneyFlow, FXEmployeeObserver>)object;

@end
