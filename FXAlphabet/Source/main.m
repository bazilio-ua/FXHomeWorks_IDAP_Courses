//
//  main.m
//  FXAlphabet
//
//  Created by Basil Nikityuk on 7/31/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FXAlphabetTests.h"

int main(int argc, const char *argv[]) {
	@autoreleasepool {
		// insert code here...
		NSLog(@"FXAlphabet");
		
		[FXAlphabetTests performTest];
	}
	
    return 0;
}

/*
 Задание 4.
 Написать расширения для строки, которая бы генерировалась случайным образом.
 ТРебования:
 1. должна быть расширяемой
 2. должна быть удобной
 3. должна предоставлять возможность работать с разными наборами символов
*/

/*
 Задание 5.
 Написать класс, реализующий обертку над алфавитом или набором символов
 Требования:
 1. не должен быть наследником nsarray
 2. может быть динамическим или работать с набором символов
 3. должен быть кластерным классом
 4. должен уметь NSFastEnumeration
*/
