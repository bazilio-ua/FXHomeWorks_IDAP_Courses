//
//  FXDataModelsArray.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/27/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXDataModelsArray.h"

#import "FXDataModel.h"

#import "NSFileManager+FXExtensions.h"

#import "FXDispatch.h"
#import "FXMacros.h"

static const NSUInteger kFXDefaultSleepTimeInterval	= 5;
static const NSUInteger kFXDefaultDataModelsCount	= 9;
static NSString * const kFXDefaultFileName			= @"FXTable.plist";

@interface FXDataModelsArray ()
@property (nonatomic, readonly)	NSString	*fileName;
@property (nonatomic, readonly)	NSString	*fileFolder;
@property (nonatomic, readonly)	NSString	*filePath;
@property (nonatomic, readonly)	NSArray		*notifications;

@property (nonatomic, readonly, getter = isCached)	BOOL	cached;

- (void)fillWithModels:(NSUInteger)count;

- (void)subscribeToApplicationNotifications:(NSArray *)notifications;
- (void)unsubscribeFromApplicationNotifications:(NSArray *)notifications;

@end

@implementation FXDataModelsArray

@dynamic fileName;
@dynamic fileFolder;
@dynamic filePath;
@dynamic cached;
@dynamic notifications;

#pragma mark -
#pragma mark Class Methods

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	[self unsubscribeFromApplicationNotifications:self.notifications];
	[self removeObserver:self];
}

- (id)init {
	self = [super init];
	if (self) {
		[self subscribeToApplicationNotifications:self.notifications];
		[self addObserver:self];
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

- (NSArray *)notifications { // do category?
	return [NSArray arrayWithObjects:UIApplicationWillTerminateNotification, UIApplicationWillResignActiveNotification, nil];
}

#pragma mark -
#pragma mark Public Methods

- (void)save {
	[NSKeyedArchiver archiveRootObject:self.array toFile:self.filePath];
}

- (void)dump {
	
}

#pragma mark -
#pragma mark Overriden Public Methods

- (void)performLoading {
	id block = nil;
	if (self.cached) {
		FXSleep(kFXDefaultSleepTimeInterval);
		id objects = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
		block = ^{
			[self addObjects:objects];
		};
	} else {
		block = ^{
			[self fillWithModels:kFXDefaultDataModelsCount];
		};
	}
	
	[self performBlock:block shouldNotify:NO];
	
	FXDispatchAsyncOnMainQueueWithBlock(^{
		void(^block)(void) = ^{
			self.state = kFXModelLoaded;
		};
		
		[self performBlock:block shouldNotify:YES];
	});
}

#pragma mark -
#pragma mark Private Methods

- (void)fillWithModels:(NSUInteger)count {
	for (NSUInteger index = 0; index < count; index++) {
		[self addObject:[FXDataModel new]];
	}
}

- (void)subscribeToApplicationNotifications:(NSArray *)notifications {
	for (NSString *notification in notifications) {
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(save) 
													 name:notification 
												   object:nil];
	}
}

- (void)unsubscribeFromApplicationNotifications:(NSArray *)notifications {
	for (NSString *notification in notifications) {
		[[NSNotificationCenter defaultCenter] removeObserver:self 
														name:notification 
													  object:nil];
	}
}

#pragma mark -
#pragma mark FXModelObserver protocol

- (void)model:(FXArrayModel *)model didChangeWithChanges:(id)changes {	
	[self save];
}

@end
