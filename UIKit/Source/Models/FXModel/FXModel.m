//
//  FXModel.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 10/8/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXModel.h"

#import "FXModelObserver.h"

#import "FXDispatch.h"
#import "FXMacros.h"

@interface FXModel ()
@property (nonatomic, assign)	BOOL	shouldNotify;

@end

@implementation FXModel

@synthesize state 			= _state;
@synthesize shouldNotify	= _shouldNotify;

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)init {
	self = [super init];
	if (self) {
		self.shouldNotify = YES;
	}
	
	return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(FXModelState)state {
	[self setState:state withChanges:nil];
}

- (void)setState:(FXModelState)state withChanges:(id)changes {
	@synchronized(self) {
		if (state != _state) {
			_state = state;
		}
		
		if (self.shouldNotify) {
			[self notifyObserversWithSelector:[self selectorForState:state] withObject:changes];
		}
	}
}

#pragma mark -
#pragma mark Overloaded Methods

- (SEL)selectorForState:(FXModelState)state {
	SEL selector = NULL;
	switch (state) {
		case kFXModelWillLoad:
			selector = @selector(modelWillLoad:);
			break;
			
		case kFXModelLoaded:
			selector = @selector(modelDidLoad:);
			break;
			
		case kFXModelFailedLoading:
			selector = @selector(modelDidFailLoading:);
			break;
			
		case kFXModelDidChange:
			selector = @selector(model:didChangeWithChanges:);
			break;
			
		case kFXModelUnloaded:
		default:
			break;
	}
	
	return selector;
}

#pragma mark -
#pragma mark Public Methods

- (void)load {
	@synchronized(self) {
		FXModelState state = self.state;
		if (kFXModelLoaded == state || kFXModelWillLoad == state || kFXModelDidChange == state) {
			[self notifyObserversWithSelector:[self selectorForState:state]];
			
			return;
		}
		
		void(^block)(void) = ^{
			self.state = kFXModelWillLoad;
		};
		
		[self performBlock:block shouldNotify:YES];
	}
	
	[self setupLoading];
	
	FXWeakify(self);
	FXDispatchAsyncOnBackgroundQueueWithBlock(^{
		FXStrongifyAndReturnIfNil(self);
		[self performLoading];
	});
}

- (void)setupLoading {
	// intended to be reloaded in subclasses
}

- (void)performLoading {
	// intended to be reloaded in subclasses
}

- (void)performBlock:(void (^)(void))block shouldNotify:(BOOL)shouldNotify {
	@synchronized(self) {
		BOOL notificationState = self.shouldNotify;
		self.shouldNotify = shouldNotify;
		if (block) {
			block();
		}
		
		self.shouldNotify = notificationState;
	}
}

@end
