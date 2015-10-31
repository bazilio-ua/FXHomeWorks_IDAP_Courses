//
//  NSURLConnection+FXExtensions.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/25/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLConnection (FXExtensions)

+ (void)asyncRequest:(NSURLRequest *)request 
   completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler;

@end
