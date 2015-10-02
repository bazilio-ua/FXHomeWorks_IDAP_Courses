//
//  FXArrayModelChanges.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/2/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	kFXArrayModelChangesAdding,
	kFXArrayModelChangesRemoving,
	kFXArrayModelChangesMoving
} FXArrayModelChangesState;

@interface FXArrayModelChanges : NSObject
@property (nonatomic, readonly, assign)	FXArrayModelChangesState	state;

@end
