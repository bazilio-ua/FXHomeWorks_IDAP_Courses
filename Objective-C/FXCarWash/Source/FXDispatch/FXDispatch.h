//
//  FXDispatch.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/29/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

extern
void FXDispatchSyncOnMainQueueWithBlock(dispatch_block_t block);

extern
void FXDispatchAsyncOnMainQueueWithBlock(dispatch_block_t block);

extern
void FXDispatchAsyncOnBackgroundQueueWithBlock(dispatch_block_t block);
