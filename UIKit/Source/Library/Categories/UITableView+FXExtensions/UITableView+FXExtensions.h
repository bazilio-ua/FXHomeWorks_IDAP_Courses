//
//  UITableView+FXExtensions.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/22/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (FXExtensions)

- (id)dequeueReusableCellWithClass:(Class)aClass;

- (NSInteger)numberOfRows;

- (void)updateWithChanges:(id)changes;
- (void)updateWithChanges:(id)changes rowAnimation:(UITableViewRowAnimation)rowAnimation;

@end
