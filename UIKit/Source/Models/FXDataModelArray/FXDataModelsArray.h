//
//  FXDataModelsArray.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/27/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXArrayModel.h"

@interface FXDataModelsArray : FXArrayModel

+ (id)arrayWithCount:(NSUInteger)count;

- (id)initWithCount:(NSUInteger)count;

- (void)save;
- (void)dump;

@end
