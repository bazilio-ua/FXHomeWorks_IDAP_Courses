//
//  FXArrayModelObserver.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FXArrayModel;
@class FXArrayModelChanges;

@protocol FXArrayModelObserver <NSObject>

@optional
- (void)modelDidUnload:(id)model;
- (void)modelDidLoading:(id)model;
- (void)modelDidLoad:(id)model;
- (void)modelDidFailedLoading:(id)model;

@required
- (void)arrayModel:(FXArrayModel *)model didChangeWithChanges:(FXArrayModelChanges *)changes;

@end
