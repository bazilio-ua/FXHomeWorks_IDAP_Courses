//
//  FXMacros.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/27/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

/*
 * main View generation macro
 */
#define FXDefineMainViewProperty(propertyName, viewClass) \
	@property (nonatomic, readonly)	viewClass *propertyName;

#define FXMainViewGetterSynthesize(selector, viewClass) \
	- (viewClass *)selector { \
		if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
			return (viewClass *)self.view; \
		} \
		\
		return nil; \
	}

#define FXViewControllerMainViewProperty(viewControllerClass, propertyName, viewClass) \
	@interface viewControllerClass (__##viewClass##_##propertyName) \
	FXDefineMainViewProperty(propertyName, viewClass) \
	\
	@end \
	\
	@implementation viewControllerClass (__##viewClass##_##propertyName) \
	\
	@dynamic propertyName; \
	\
	FXMainViewGetterSynthesize(propertyName, viewClass) \
	\
	@end

/*
 * weakify / strongify macro
 */
#define FXWeakify(object) \
	id __weak __FXWeakified_##object = object

// these macroses below should be called only after weakify was called for the same object
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

