//
//  FXDataModelsArray.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/27/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXDataModelsArray.h"

#import "FXDataModel.h"
#import "FXDispatch.h"
#import "FXMacros.h"

#import "NSFileManager+FXExtensions.h"

static const NSUInteger kFXDefaultSleepTimeInterval = 5;
static const NSUInteger kFXDefaultDataModelsCount = 9;
static NSString * const kFXDefaultFileName = @"FXTable.plist";

@interface FXDataModelsArray ()
@property (nonatomic, readonly)	NSString	*fileName;
@property (nonatomic, readonly)	NSString	*fileFolder;
@property (nonatomic, readonly)	NSString	*filePath;

@property (nonatomic, readonly, getter = isCached)	BOOL	cached;

- (void)fillWithModels:(NSUInteger)count;

@end

@implementation FXDataModelsArray

@dynamic fileName;
@dynamic fileFolder;
@dynamic filePath;
@dynamic cached;

#pragma mark -
#pragma mark Class Methods

+ (id)arrayWithCount:(NSUInteger)count {
	return [[self alloc] initWithCount:count];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)initWithCount:(NSUInteger)count {
	self = [super init];
	if (self) {
		[self fillWithModels:count];
	}
	
	return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)fileName {
	return kFXDefaultFileName;
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

- (void)save {
	[NSKeyedArchiver archiveRootObject:self toFile:self.filePath];
}

#pragma mark -
#pragma mark Overriden Public Methods

- (void)performLoading {
	if ([self isCached]) {
		FXSleep(kFXDefaultSleepTimeInterval);
		id modelsArray = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
		
		void(^block)(void) = ^{
			for (id model in modelsArray) {
				[self addObject:model];
			}
		};
		
		[self performBlock:block withNotification:NO];
	} else {
		[self fillWithModels:kFXDefaultDataModelsCount];
	}
	
	FXDispatchAsyncOnMainQueueWithBlock(^{
		void(^block)(void) = ^{
			self.state = kFXModelLoaded;
		};
		
		[self performBlock:block withNotification:YES];
	});
}

#pragma mark -
#pragma mark Private Methods

- (void)fillWithModels:(NSUInteger)count {
	void(^block)(void) = ^{
		for (NSUInteger index = 0; index < count; index++) {
			[self addObject:[FXDataModel new]];
		}
	};
	
	[self performBlock:block withNotification:NO];
}

@end
