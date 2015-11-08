//
//  FXFriendDetailView.h
//  FXUsers
//
//  Created by Basil Nikityuk on 11/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXView.h"

#import "FXUserModelObserver.h"

@class FXImageView;
@class FXUserModel;

@interface FXFriendDetailView : FXView <FXUserModelObserver>
@property (nonatomic, strong)	IBOutlet	FXImageView		*contentImageView;
@property (nonatomic, strong)	IBOutlet	UILabel			*idLabel;
@property (nonatomic, strong)	IBOutlet	UILabel			*nameLabel;
@property (nonatomic, strong)	IBOutlet	UILabel			*genderLabel;
@property (nonatomic, strong)	IBOutlet	UILabel			*emailLabel;
@property (nonatomic, strong)	IBOutlet	UILabel			*locationLabel;

@property (nonatomic, strong)				FXUserModel		*model;

- (void)fillWithModel:(FXUserModel *)model;

@end
