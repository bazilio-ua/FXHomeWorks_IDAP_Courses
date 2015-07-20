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
@property (nonatomic, assign)	float		salary;

- (id)initWithExperience:(uint64_t)experience salary:(float)salary;

- (id)performEmployeeSpecificJob;

@end
