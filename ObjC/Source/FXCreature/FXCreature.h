//
//  FXCreature.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 7/7/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	kFXCreatureGenderMale = 1, // don't use Undefined
	kFXCreatureGenderFemale
} FXCreatureGender;

@interface FXCreature : NSObject

@property (nonatomic, copy)		NSString	*name;
@property (nonatomic, retain)	NSArray		*children;

@property (nonatomic, assign)	float		weight;
@property (nonatomic, assign)	uint32_t	age;
@property (nonatomic, assign)	FXCreatureGender	gender;

- (instancetype)init;
- (instancetype)initWithName:(NSString *)aName age:(uint32_t)aAge gender:(FXCreatureGender)aGender;

- (void)addChild:(FXCreature *)aChild;
- (void)removeChild:(FXCreature *)aChild;

// merge this to one method 'doMainJob'
- (void)goToBattle;
- (FXCreature *)giveBirth;

- (void)sayHello;

@end
