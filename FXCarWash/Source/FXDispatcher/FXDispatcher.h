//
//  FXDispatcher.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/30/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FXEmployeeObserver.h"

@class FXEmployee;

@interface FXDispatcher : NSObject <FXEmployeeObserver>

- (void)addHandler:(FXEmployee *)handler;
- (void)removeHandler:(FXEmployee *)handler;

- (void)processObject:(id)object;

@end
