//
//  UINib+FXExtensions.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/22/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (FXExtensions)

+ (UINib *)nibWithClass:(Class)aClass;
+ (UINib *)nibWithClass:(Class)aClass 
				 bundle:(NSBundle *)bundle;

+ (id)objectWithClass:(Class)aClass;
+ (id)objectWithClass:(Class)aClass 
			   bundle:(NSBundle *)bundle 
				owner:(id)owner 
			  options:(NSDictionary *)options;

- (id)objectWithClass:(Class)aClass;
- (id)objectWithClass:(Class)aClass 
				owner:(id)owner 
			  options:(NSDictionary *)options;

@end
