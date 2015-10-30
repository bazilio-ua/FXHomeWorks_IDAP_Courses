//
//  FXFileImageModel.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/22/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXFileImageModel.h"

#import "NSString+FXExtensions.h"
#import "NSFileManager+FXExtensions.h"

@interface FXFileImageModel ()

@end

@implementation FXFileImageModel

@dynamic fileName;
@dynamic fileFolder;
@dynamic filePath;

#pragma mark -
#pragma mark Class Methods

#pragma mark -
#pragma mark Initializations and Deallocations

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

#pragma mark -
#pragma mark Public Methods

- (void)performLoadingWithCompletion:(void (^)(UIImage *image, id error))completion {
	UIImage *image = [UIImage imageWithContentsOfFile:self.filePath];
	
	if (completion) {
		completion(image, nil);
	}
}

#pragma mark -
#pragma mark Private Methods

@end
