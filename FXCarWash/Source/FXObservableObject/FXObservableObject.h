//
//  FXObservableObject.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/9/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FXObservableObject : NSObject
@property (nonatomic, readonly)	NSSet		*observers;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (BOOL)containsObserver:(id)observer;

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object;

@end
