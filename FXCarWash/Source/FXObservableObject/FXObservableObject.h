//
//  FXObservableObject.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/9/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FXObservableObject : NSObject
//@property (nonatomic, assign)	NSUInteger	state;
@property (nonatomic, readonly)	NSSet		*observers;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (BOOL)containsObserver:(id)observer;

// this method is intended for subclassing. never call it directly.
//- (SEL)selectorForState:(NSUInteger)state;

- (void)notifyObserversWithSelector:(SEL)selector;
- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object;
- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object withObject:(id)object2;

@end
