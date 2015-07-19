//
//  FXRoom.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

//@class FXEmployee;

@interface FXRoom : NSObject
@property (nonatomic, retain) NSMutableArray *employees;

- (id)initWithEmployees:(NSArray *)employees;
- (void)addEmployee:(id)employee;
- (void)removeEmployee:(id)employee;

@end
