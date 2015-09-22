//
//  UITableView+FXExtensions.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/22/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (FXExtensions)

- (id)cellWithClass:(Class)aClass;
- (id)cellWithClass:(Class)aClass 
			 bundle:(NSBundle *)bundle 
			  owner:(id)owner 
			options:(NSDictionary *)options;

- (id)dequeueReusableCellWithClass:(Class)aClass;

@end
