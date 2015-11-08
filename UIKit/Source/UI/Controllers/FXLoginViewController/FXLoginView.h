//
//  FXLoginView.h
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXView.h"

#import "FXUserModelObserver.h"

@class FXUserModel;
@class FXImageView;

@interface FXLoginView : FXView <FXUserModelObserver>
//@property (nonatomic, strong)	IBOutlet	FXImageView		*contentImageView;
@property (nonatomic, strong)	IBOutlet	UILabel			*userIDLabel;
//@property (nonatomic, strong)	IBOutlet	UILabel			*nameLabel;
//@property (nonatomic, strong)	IBOutlet	UILabel			*genderLabel;
//@property (nonatomic, strong)	IBOutlet	UILabel			*emailLabel;
//@property (nonatomic, strong)	IBOutlet	UILabel			*locationLabel;
@property (nonatomic, strong)	IBOutlet	UIButton		*loginButton;

@property (nonatomic, strong)				FXUserModel		*model;

- (void)fillWithModel:(FXUserModel *)model;

@end

