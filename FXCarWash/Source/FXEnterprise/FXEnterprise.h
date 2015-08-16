//
//  FXEnterprise.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FXEmployee.h"

@interface FXEnterprise : NSObject <FXEmployeeObserver>

- (void)performWorkWithObject:(id)object;

@end
