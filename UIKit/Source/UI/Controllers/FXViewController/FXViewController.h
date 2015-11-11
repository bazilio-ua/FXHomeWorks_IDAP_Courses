//
//  FXViewController.h
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FXContext;
@class FXUserModel;

@interface FXViewController : UIViewController
// property for overriding in subclasses
@property (nonatomic, readonly)	Class		contextClass;
@property (nonatomic, strong)	FXContext	*context;
@property (nonatomic, strong)	FXUserModel	*model;

@end
