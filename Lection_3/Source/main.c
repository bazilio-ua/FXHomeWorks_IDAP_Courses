//
//  main.c
//  Lection_3
//
//  Created by Basil Nikityuk on 5/6/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

#define performTests(testName) \
	printf(#testName " started...\n"); \
	testName(); \
	printf(#testName " ...finished\n");

int main(int argc, const char *argv[]) {
	// insert code here...
	printf("Lection 3\n");
	
	return 0;
}

/*
 Задачи:
 1. Создать структуру, данных, хранящую в себе расположенные в случайном порядке 6 bool, 1 float, 1 int, 1 long long, 3 short, 1 double, 1 указатель на строку.
 Примечание:
 - Дополнитель должны быть объявлены и протестированы еще 2 варианта оригинальной структуры:
 1) все поля перекомпонованы так, чтобы структура имела минимальный размер (sizeof);
 2) вариант 2 с union для переменных типа bool (поместить bool значения в битовое поле и создать union);
 Требования:
 - создать тестовый метод, который бы с помощью offsetof выводил расположение каждого из элементов структуры;
 - создать тестовый метод, который бы выводил размер всей структуры;
 2. Создать универсальный метод для вывода битов числа (различных типов) в консоль.
 */
