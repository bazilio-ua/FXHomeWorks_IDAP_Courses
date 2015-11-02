//
//  FXLoginViewController.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "FXLoginViewController.h"

@interface FXLoginViewController ()

@end

@implementation FXLoginViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	FBSDKLoginButton *loginButton = [FBSDKLoginButton new];
	loginButton.center = self.view.center;
	[self.view addSubview:loginButton];
}

@end
