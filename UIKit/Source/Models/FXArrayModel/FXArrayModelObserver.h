//
//  FXArrayModelObserver.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/1/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FXArrayModel;
@class FXArrayChangesModel;

@protocol FXArrayModelObserver <NSObject>

@required
- (void)arrayModel:(FXArrayModel *)model didChangeWithChanges:(FXArrayChangesModel *)changes;

@end
