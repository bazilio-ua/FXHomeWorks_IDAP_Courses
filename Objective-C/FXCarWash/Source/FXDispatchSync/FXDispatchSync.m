//
//  FXDispatchSync.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/29/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXDispatchSync.h"

void FXDispatchSyncOnMainQueueWithBlock(dispatch_block_t block) {
	if (block) {
		if ([NSThread isMainThread]) {
			block();
		} else {
			dispatch_sync(dispatch_get_main_queue(), block);
		}
	}
}
