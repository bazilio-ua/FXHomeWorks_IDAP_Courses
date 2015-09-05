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
#import "FXEmployeeObserver.h"

typedef enum {
	kFXEmployeeIsReady,
	kFXEmployeeStartedWork,
	kFXEmployeeFinishedWork
} FXEmployeeState;

@interface FXEmployee : FXObservableObject <FXMoneyFlow, FXEmployeeObserver>
@property (nonatomic, assign)	FXEmployeeState		state;

- (SEL)selectorForState:(FXEmployeeState)state;

// reloaded in subclasses
- (void)processObject:(id<FXMoneyFlow, FXEmployeeObserver>)object;

- (void)processJobWithObject:(id<FXMoneyFlow, FXEmployeeObserver>)object;
- (void)processJobWithObjectInBackground:(id<FXMoneyFlow, FXEmployeeObserver>)object;
- (void)finishJobWithObjectOnMainThread:(id<FXMoneyFlow, FXEmployeeObserver>)object;

@end
