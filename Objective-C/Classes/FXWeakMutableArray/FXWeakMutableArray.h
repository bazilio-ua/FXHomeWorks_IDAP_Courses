//
//  FXWeakMutableArray.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/24/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXMutableArray.h"

@interface FXWeakMutableArray : FXMutableArray
@property (nonatomic, readonly)	NSArray	*weakReferences;

@end
