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
- (void)modelWillLoad:(id)model;
- (void)modelDidLoad:(id)model;
- (void)modelFailedLoading:(id)model;

@required
- (void)model:(id)model didChangeWithChanges:(id)changes;

@end
