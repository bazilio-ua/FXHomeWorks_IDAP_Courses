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

@property (nonatomic, retain)	NSArray		*children;

- (id)init;
- (id)initWithName:(NSString *)name age:(uint32_t)age gender:(FXCreatureGender)gender;

- (void)addChild:(FXCreature *)child;
- (void)removeChild:(FXCreature *)child;

// merge this to one method 'doMainJob'?
- (void)goToBattle;
- (FXCreature *)giveBirth;

- (void)sayHello;

@end
