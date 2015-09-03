//
//  FXEmployeesPool.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/3/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FXEmployeesPool : NSObject
@property (nonatomic, copy, readonly)	NSArray		*employees;

- (void)addEmployee:(id)employee;
- (void)removeEmployee:(id)employee;
- (BOOL)containsEmployee:(id)employee;
- (NSArray *)allEmployeesOfClass:(Class)class;
- (id)readyEmployeeOfClass:(Class)class;

@end
