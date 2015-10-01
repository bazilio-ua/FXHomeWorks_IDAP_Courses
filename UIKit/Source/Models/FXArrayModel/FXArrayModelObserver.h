//
//  FXArrayModelObserver.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FXArrayModel;

@protocol FXArrayModelObserver <NSObject>

@optional
- (void)arrayModelUnchanged:(FXArrayModel *)arrayModel;
- (void)arrayModelDidChange:(FXArrayModel *)arrayModel;

@end
