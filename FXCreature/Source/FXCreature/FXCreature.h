//
//  FXCreature.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/7/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	kFXCreatureGenderUndefined,
	kFXCreatureGenderMale,
	kFXCreatureGenderFemale
} FXCreatureGender;

@interface FXCreature : NSObject
@property (nonatomic, copy, readonly)	NSArray		*children;
@property (nonatomic, copy, readonly)	NSString	*name;

@property (nonatomic, assign)			float		weight;
@property (nonatomic, assign)			uint32_t	age;
//@property (nonatomic, assign, readonly)	FXCreatureGender	gender;

//- (id)initWithName:(NSString *)name age:(uint32_t)age gender:(FXCreatureGender)gender;
- (id)initWithName:(NSString *)name age:(uint32_t)age;

- (void)addChild:(FXCreature *)child;
- (void)removeChild:(FXCreature *)child;
/*
// merge this to one method 'doMainJob'?
- (void)goToBattle;
- (FXCreature *)giveBirth;
*/
- (id)performGenderSpecificOperation;

- (void)sayHello;
//- (NSString *)genderString;

@end
