//
//  FXEmployeeObserver.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/23/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FXEmployee;

@protocol FXEmployeeObserver <NSObject>
@optional
- (void)employeeIsReady:(FXEmployee *)employee;
- (void)employeeDidStartWork:(FXEmployee *)employee;
- (void)employeeDidFinishWork:(FXEmployee *)employee;

@end
