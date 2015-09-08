//
//  FXReference.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 8/11/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FXReference : NSObject <NSCopying>
@property (nonatomic, readonly)	id	target;

// overriding in subclasses
- (id)initWithTarget:(id)object;

@end
