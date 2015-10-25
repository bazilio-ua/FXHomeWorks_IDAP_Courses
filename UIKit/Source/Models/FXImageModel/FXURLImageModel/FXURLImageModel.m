//
//  FXURLImageModel.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/22/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXURLImageModel.h"

#import "NSFileManager+FXExtensions.h"
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

- (NSString *)fileName {
	return [self.url lastPathComponent];
}

- (NSString *)fileFolder {
	return [NSFileManager userDocumentsPath];
}

- (NSString *)filePath {
	return [self.fileFolder stringByAppendingPathComponent:self.fileName];
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
						[data writeToFile:self.filePath options:NSDataWritingAtomic error:nil];
					}
					
					[super performLoadingWithCompletion:completion];
				}];
}

@end
