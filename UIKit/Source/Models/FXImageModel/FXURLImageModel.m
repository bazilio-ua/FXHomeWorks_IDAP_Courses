//
//  FXURLImageModel.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/22/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXURLImageModel.h"

#import "NSString+FXExtensions.h"
#import "NSFileManager+FXExtensions.h"
#import "NSURLConnection+FXExtensions.h"

@interface FXURLImageModel ()

- (void)loadImageFromInternetWithCompletion:(void (^)(UIImage *image, id error))completion;
- (void)writeToCacheWithData:(NSData *)data;
- (void)deleteFromCacheIfNeeded;

@end

@implementation FXURLImageModel

@dynamic cached;

#pragma mark -
#pragma mark Accessors

- (NSString *)fileName {
	NSString *absolutePath = [self.url absoluteString];
	
	return [absolutePath URLEncodedString];
}

- (NSString *)fileFolder {
	return [NSFileManager userDocumentsPath];
}

- (NSString *)filePath {
	return [self.fileFolder stringByAppendingPathComponent:self.fileName];
}

- (BOOL)isCached {
	return [[NSFileManager defaultManager] fileExistsAtPath:self.filePath];
}

#pragma mark -
#pragma mark Public Methods

- (void)performLoadingWithCompletion:(void (^)(UIImage *image, id error))completion {
	if (self.cached) {
		[super performLoadingWithCompletion:completion];
		if (!self.image) {
			[self deleteFromCacheIfNeeded];
			[self loadImageFromInternetWithCompletion:completion];
		}
	} else {
		[self loadImageFromInternetWithCompletion:completion];
	}
}

#pragma mark -
#pragma mark Private Methods

- (void)loadImageFromInternetWithCompletion:(void (^)(UIImage *image, id error))completion {
	NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
	[NSURLConnection asyncRequest:request 
				completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
					UIImage *image = [UIImage imageWithData:data];
					if (image) {
						[self writeToCacheWithData:data];
					}
					
					if (completion) {
						completion(image, error);
					}
				}];
}

- (void)writeToCacheWithData:(NSData *)data {
	NSError *error = nil;
	[data writeToFile:self.filePath options:NSDataWritingAtomic error:&error];
	if (error) {
		NSLog(@"%@", [error localizedDescription]);
	}
}

- (void)deleteFromCacheIfNeeded {
	if (self.cached) {
		NSError *error = nil;
		[[NSFileManager defaultManager] removeItemAtPath:self.filePath error:&error];
		if (error) {
			NSLog(@"%@", [error localizedDescription]);
		}
	}
}

@end
