//
//  FXModelObserver.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FXModelObserver <NSObject>

@optional
- (void)modelDidUnload:(id)model;
- (void)modelDidLoading:(id)model;
- (void)modelDidLoad:(id)model;
- (void)modelDidFailLoading:(id)model;

@required
- (void)arrayModel:(id)model didChangeWithChanges:(id)changes;

@end
