//
//  FXRoom.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FXRoom : NSObject
@property (nonatomic, copy, readonly)	NSArray		*employees;
@property (nonatomic, assign)			NSUInteger	employeeCapacity;

- (void)addEmployee:(id)employee;
- (void)removeEmployee:(id)employee;

@end
