//
//  FXDispatcher.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/30/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FXDispatcher : NSObject

- (void)addHandler:(id)handler;
- (void)removeHandler:(id)handler;

- (void)processObject:(id)object;

@end
