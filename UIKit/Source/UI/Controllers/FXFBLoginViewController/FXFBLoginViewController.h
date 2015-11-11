//
//  FXFBLoginViewController.h
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXViewController.h"

#import "FXUserModelObserver.h"

@interface FXFBLoginViewController : FXViewController <FXUserModelObserver>

- (IBAction)onLoginButton:(id)sender;

@end
