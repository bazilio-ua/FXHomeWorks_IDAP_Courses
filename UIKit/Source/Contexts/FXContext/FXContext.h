//
//  FXContext.h
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FXUserModel;

@interface FXContext : NSObject
@property (nonatomic, readonly)	FXUserModel	*model;

+ (id)contextWithModel:(FXUserModel *)model;

- (id)initWithModel:(FXUserModel *)model;

// methods for overriding in subclasses
- (void)execute;
- (void)cancel;
- (void)parseWithResult:(id)result error:(NSError *)error;

@end
