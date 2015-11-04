//
//  FXGraphRequestContext.m
//  FXUsers
//
//  Created by Basil Nikityuk on 11/4/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "FXGraphRequestContext.h"

@interface FXGraphRequestContext ()
@property (nonatomic, strong)	FBSDKGraphRequestConnection	*connection;
@property (nonatomic, readonly)	FBSDKGraphRequest			*request;

@end

@implementation FXGraphRequestContext

#pragma mark -
#pragma mark Accessors

- (FBSDKGraphRequest *)request {
	return [[FBSDKGraphRequest alloc] initWithGraphPath:[self graphPath]
											 parameters:[self graphPathParameters]];
}

- (void)setConnection:(FBSDKGraphRequestConnection *)connection {
	if (_connection != connection) {
		[_connection cancel];
		_connection = connection;
	}
}

#pragma mark -
#pragma mark Public Methods

- (NSString *)graphPath {
	return nil;
}

- (NSDictionary *)graphPathParameters {
	return nil;
}

- (void)parseWithResult:(id)result error:(NSError *)error {
	
}

#pragma mark -
#pragma mark Overriden Public Methods

- (void)execute {
	id handler = ^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
		[self parseWithResult:result error:error];
	};
	
	self.connection = [self.request startWithCompletionHandler:handler];
}

- (void)cancel {
	self.connection = nil;
}

@end
