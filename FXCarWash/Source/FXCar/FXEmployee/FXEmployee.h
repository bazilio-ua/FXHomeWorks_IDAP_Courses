//
//  FXEmployee.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/17/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FXEmployee : NSObject
@property (nonatomic, assign)	uint64_t	experience;
@property (nonatomic, assign)	uint32_t	salary;

- (id)initWithExperience:(uint64_t)experience salary:(uint32_t)salary;

- (id)performEmployeeSpecificJob;

@end
