//
//  FXFBGraphRequestContext.h
//  FXUsers
//
//  Created by Basil Nikityuk on 11/4/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXContext.h"

@interface FXFBGraphRequestContext : FXContext

// methods for overriding in subclasses
- (NSString *)graphPath;
- (NSDictionary *)graphPathParameters;

@end
