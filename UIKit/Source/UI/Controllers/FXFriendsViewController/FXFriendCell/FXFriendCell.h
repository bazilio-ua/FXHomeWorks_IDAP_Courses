//
//  FXFriendCell.h
//  FXUsers
//
//  Created by Basil Nikityuk on 11/5/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXTableViewCell.h"

#import "FXModelObserver.h"

@class FXUserModel;
@class FXImageView;

@interface FXFriendCell : FXTableViewCell
@property (nonatomic, strong)	IBOutlet	FXImageView		*contentImageView;
@property (nonatomic, strong)	IBOutlet	UILabel			*nameLabel;

@property (nonatomic, strong)	FXUserModel					*model;

- (void)fillWithModel:(FXUserModel *)model;

@end
