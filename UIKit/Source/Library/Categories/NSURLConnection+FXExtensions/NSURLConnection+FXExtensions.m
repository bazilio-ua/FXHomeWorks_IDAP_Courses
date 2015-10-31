//
//  NSURLConnection+FXExtensions.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/25/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "NSURLConnection+FXExtensions.h"

#import "FXDispatch.h"

@implementation NSURLConnection (FXExtensions)

+ (void)asyncRequest:(NSURLRequest *)request 
   completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler 
{
	FXDispatchAsyncOnBackgroundQueueWithBlock(^{
		NSURLResponse *response = nil;
		NSError *error = nil;
		NSData *data = [NSURLConnection sendSynchronousRequest:request 
											 returningResponse:&response 
														 error:&error];
		if (completionHandler) {
			completionHandler(data, response, error);
		}
	});
}

@end
