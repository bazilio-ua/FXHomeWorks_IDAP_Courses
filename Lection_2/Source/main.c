//
//  main.c
//  Lection_2
//
//  Created by Basil Nikityuk on 5/6/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#include "FXPrimitiveOutputType.h"
#include "FXPrimitiveOutputTypeTests.h"

#define performTests(testName) \
	printf(#testName " started...\n"); \
	testName(); \
	printf(#testName " ...finished\n");

int main(int argc, const char *argv[]) {
	// insert code here...
	printf("Lection 2\n");
	
	performTests(FXPrimitiveOutputTypeTest); // part 1
	
	return 0;
}

/*
 Задачи:
 1. Создать макрос, который бы генерировал метод для вывода в консоль значения любого примитивного типа. У макроса должно быть 2 параметра: тип, спецификатор вывода. При препроцессинге макрос должен создавать метод output_type, где вместо type должен быть подставлен тип, который мы выводим данным сгенерированным методом. Создать второй макрос, который бы занимался вызовом сгенерированного первым макросом метода, на вход должен получать тип метода и величину.
 Требования:
 - создать тестовые методы для проверки того, как работает генерация на всех примитивных типах.
 */