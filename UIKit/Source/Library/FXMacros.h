//
//  FXMacros.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/27/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

/*
 * base View generation macro
 */
#define FXDefineBaseViewProperty(propertyName, viewClass) \
	@property (nonatomic, readonly)	viewClass *propertyName;

#define FXBaseViewGetterSynthesize(selector, viewClass) \
	- (viewClass *)selector { \
		if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
			return (viewClass *)self.view; \
		} \
		\
		return nil; \
	}

#define FXViewControllerBaseViewProperty(viewControllerClass, propertyName, viewClass) \
	@interface viewControllerClass (__##viewClass##_##propertyName) \
	FXDefineBaseViewProperty(propertyName, viewClass) \
	\
	@end \
	\
	@implementation viewControllerClass (__##viewClass##_##propertyName) \
	\
	@dynamic propertyName; \
	\
	FXBaseViewGetterSynthesize(propertyName, viewClass) \
	\
	@end

/*
 * weakify / strongify macro
 */
#define FXWeakify(object) \
	id __weak __FXWeakified_##object = object

// you should only call this method after you called weakify for that same variable
#define FXStrongify(object) \
	id __strong object = __FXWeakified_##object

#define FXStrongifyAndReturnResultIfNil(object, result) \
	FXStrongify(object); \
	if (!object) { \
		return result; \
	}

#define FXEmpty

#define FXStrongifyAndReturnIfNil(object) \
	FXStrongifyAndReturnResultIfNil(object, FXEmpty)

#define FXStrongifyAndReturnNilIfNil(object) \
	FXStrongifyAndReturnResultIfNil(object, nil)

/*
 * synthesize setter macro
 */
// with observing
#define FXSynthesizeObservableSetterWithExpression(propertyName, expression) \
	if (_##propertyName != propertyName) { \
		[_##propertyName removeObserver:self]; \
		_##propertyName = propertyName; \
		[_##propertyName addObserver:self]; \
		expression \
	}

#define FXLoad(propertyName) \
	[_##propertyName load];

#define FXSynthesizeObservableSetter(propertyName) \
	FXSynthesizeObservableSetterWithExpression(propertyName, FXEmpty)

#define FXSynthesizeObservableSetterAndLoad(propertyName) \
	FXSynthesizeObservableSetterWithExpression(propertyName, FXLoad(propertyName))

// with context execution
#define FXSynthesizeContextSetter(propertyName) \
	if (_##propertyName != propertyName) { \
		[_##propertyName cancel]; \
		_##propertyName = propertyName; \
		[_##propertyName execute]; \
	}

/*
 * sleepy macro
 */
#define FXSleepDefine 1

#if FXSleepDefine
	#define FXSleep(time) [NSThread sleepForTimeInterval:time]
#else
	#define FXSleep(time)
#endif
