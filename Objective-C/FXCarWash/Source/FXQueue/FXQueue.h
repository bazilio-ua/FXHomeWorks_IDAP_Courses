//
//  FXQueue.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/22/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FXQueue : NSObject
@property (nonatomic, readonly) NSArray *queue;

- (void)enqueueObject:(id)object;
- (id)dequeueObject;
- (BOOL)containsObject:(id)object;

- (BOOL)isEmpty;

@end