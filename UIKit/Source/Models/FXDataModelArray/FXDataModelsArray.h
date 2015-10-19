//
//  FXDataModelsArray.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/27/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXArrayModel.h"

#import "FXModelObserver.h"

@interface FXDataModelsArray : FXArrayModel <FXModelObserver>

- (void)save;
- (void)dump;

@end
