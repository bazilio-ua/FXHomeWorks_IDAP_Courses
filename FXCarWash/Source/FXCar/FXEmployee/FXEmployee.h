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
@property (nonatomic, assign)	NSInteger	salary;

- (id)initWithExperience:(uint64_t)experience 
				  salary:(NSInteger)salary;

- (id)performEmployeeSpecificJob;

@end
