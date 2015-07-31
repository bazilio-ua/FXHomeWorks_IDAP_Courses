//
//  FXCreature.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/7/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FXCreature.h"
#import "NSObject+FXExtensions.h"

#pragma mark -
#pragma mark Private Interface

@interface FXCreature ()
@property (nonatomic, copy)		NSString	*name;
@property (nonatomic, retain)	NSMutableArray		*mutableChildren;
//@property (nonatomic, assign)	FXCreatureGender	gender;

@end

@implementation FXCreature
@synthesize name 	= _name;
@synthesize mutableChildren = _mutableChildren;

@synthesize weight 	= _weight;
@synthesize age 	= _age;
//@synthesize gender 	= _gender;

@dynamic children; // 'dynamic' don't generate setter/getter

#pragma mark -
#pragma mark Class Methods

// currently is no class methods

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
	// release all retained properties
	self.name = nil;
	self.mutableChildren = nil;
	
	[super dealloc]; // dealloc superclass
}

- (id)init {
//	return [self initWithName:@"Unnamed" age:0 gender:kFXCreatureGenderUndefined];
	return [self initWithName:@"Unnamed" age:0];
}

//- (id)initWithName:(NSString *)name age:(uint32_t)age gender:(FXCreatureGender)gender {
- (id)initWithName:(NSString *)name age:(uint32_t)age {
	self = [super init]; // init superclass
	
	if (self) {
		self.name = name;
		self.mutableChildren = [NSMutableArray array];
		self.age = age;
//		self.gender = gender;
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Methods

//- (void)addChild:(FXCreature *)child {
- (void)addChild:(id)child {
	if (nil != child) {
		[self.mutableChildren addObject:child];
	}
}

//- (void)removeChild:(FXCreature *)child {
- (void)removeChild:(id)child {
	if (nil != child) {
		[self.mutableChildren removeObject:child];
	}
}
/*
// merge this to one method 'doMainJob'?
- (void)goToBattle {
	if (kFXCreatureGenderMale == self.gender) {
		NSLog(@"I go to battle");
	}
}

- (FXCreature *)giveBirth {
	if (kFXCreatureGenderFemale == self.gender) {
		NSLog(@"I gave birth");
		
		return [[[FXCreature alloc] init] autorelease];
	}
	
	return nil;
}
*/

- (id)performGenderSpecificOperation {
	// do nothing
	return nil;
}

- (void)sayHello {
//	NSLog(@"Hello, My name is: %@, I am %@", self.name, [self genderString]);
	NSLog(@"Hello, My name is: %@", self.name);
	
	for (FXCreature *children in self.mutableChildren) {
		NSLog(@"I have child");
		[children sayHello];
	}
}
/*
- (NSString *)genderString {
	NSString *string;
	FXCreatureGender gender = self.gender;
	if (kFXCreatureGenderMale == gender) {
		string = @"male";
	} else if (kFXCreatureGenderFemale == gender) {
		string = @"female";
	} else {
		string = @"undefined";
	}
	
	return string;
}
*/
/*
- (NSString *)description {
	return [NSString stringWithFormat:@"%@", [super description]];
}
*/
#pragma mark -
#pragma mark Public Accessors

- (NSArray *)children {
	return [[self.mutableChildren copy] autorelease];
}

@end
