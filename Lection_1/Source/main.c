//
//  main.c
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 5/4/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#include "FXParentOutput.h"
#include "FXSizeOfTypeOutput.h"
#include "FXParentOutputTests.h"
#include "FXSizeOfTypeOutputTests.h"

#define performTests(testName) \
	printf(#testName " started...\n"); \
	testName(); \
	printf(#testName " ...finished\n");

int main(int argc, const char *argv[]) {
	// insert code here...
	printf("Lection 1 homework\n");
	
	performTests(FXSizeOfTypeOutputTests); // part 1
	performTests(FXParentOutputTests); // part 2
	
	return 0;
}

/*
 Задание:
 1. Вывести размер типов через sizeof.
 2. Создать метод, который бы имел, как параметр, целое число. Возвращать метод должен также целое число.
 Пользовательские истории:
 - если на вход приходит число, кратное 3, то в консоль должно быть выведено: "мама";
 - если на вход приходит число, кратное 5, то в консоль должно быть выведено: "папа";
 - если на вход приходит число, кратное 15, то в консоль должно быть выведено: "мамапапа";
 - если на вход приходит число, не удовлетворяющие критериям выше, то в консоль ничего выводить не надо;
 - каждому из состояний вывода в консоль должно быть присвоено определенное число (4 варианта) и возвращено из метода.
 Требования:
 - необходимо протестировать поведение, создав группу тестовых методов;
 - необходимо в цикле пройти 1000 итераций, вывести номер итерации и передать номер итерации в метод.
 */
