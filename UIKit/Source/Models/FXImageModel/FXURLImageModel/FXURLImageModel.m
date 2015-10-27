//
//  FXURLImageModel.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/22/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXURLImageModel.h"

#import "NSURLConnection+FXExtensions.h"

#import "FXMacros.h"

@interface FXURLImageModel ()
@property (nonatomic, strong)	NSURLConnection	*connection;

- (void)loadImageFromInternet:(void (^)(UIImage *image, id error))completion;

@end

@implementation FXURLImageModel

@synthesize connection = _connection;

#pragma mark -
#pragma mark Class Methods

#pragma mark -
#pragma mark Initializations and Deallocations

#pragma mark -
#pragma mark Accessors

- (void)setConnection:(NSURLConnection *)connection {
	if (_connection != connection) {
		[_connection cancel];
		_connection = connection;
		[_connection start];
	}
}

#pragma mark -
#pragma mark Public Methods

- (void)performLoadingWithCompletion:(void (^)(UIImage *image, id error))completion {
	if (self.cached) {
		[super performLoadingWithCompletion:completion];
	} else {
		[self loadImageFromInternet:completion];
	}
}

#pragma mark -
#pragma mark Private Methods

- (void)loadImageFromInternet:(void (^)(UIImage *image, id error))completion {
	NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
	[NSURLConnection asyncRequest:request 
				completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
					if (!error) {
						NSError *writeError = nil;
						[data writeToFile:self.filePath options:NSDataWritingAtomic error:&writeError];
						if (writeError) {
							NSLog(@"%@", [writeError localizedDescription]);
						}
					} else {
						NSLog(@"%@", [error localizedDescription]);
					}
					
					[super performLoadingWithCompletion:completion];
				}];
}

@end
