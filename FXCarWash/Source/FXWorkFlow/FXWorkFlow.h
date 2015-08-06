//
//  FXWorkFlow.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/20/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FXBuilding;

@interface FXWorkFlow : NSObject
@property (nonatomic, readonly)	FXBuilding	*workFlowBuilding;

- (void)performWorkFlowWithObject:(id)object;

@end
