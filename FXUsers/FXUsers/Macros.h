#ifndef NS_DESIGNATED_INITIALIZER
	#if __has_attribute(objc_designated_initializer)
		#define NS_DESIGNATED_INITIALIZER __attribute((objc_designated_initializer))
	#else
		#define NS_DESIGNATED_INITIALIZER
	#endif
#endif
