//
//  FXUserModelObserver.h
//  FXUsers
//
//  Created by Basil Nikityuk on 11/4/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXModelObserver.h"

@protocol FXUserModelObserver <FXModelObserver>

@optional
- (void)modelDidChangeID:(id)model;

@end
