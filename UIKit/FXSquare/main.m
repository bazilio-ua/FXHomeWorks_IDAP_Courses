//
//  main.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/8/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FXAppDelegate.h"

int main(int argc, char *argv[]) {
	@autoreleasepool {
	    return UIApplicationMain(argc, argv, nil, NSStringFromClass([FXAppDelegate class]));
	}
}

/*
 Задание 1.
 1. Создать подкласс вида и забиндить его в интерфейс билдере через IBOutlet на общий вид контроллера;
 2. Анимации должны быть реализованы в виде;
 3. Добавить typedef состояний положений квадратика (четыре угла);
 4. Создать проперти squarePosition для установления положения с сеттерами удовлетворяющими следующим требованиям:
 - setSquarePosition, где бы устанавливалось значение из тайпдефа положений квадратика, и само положение квадратика менялось бы без анимации;
 - setSquarePosition:animated: , в котором бы при animated = YES происходила анимация от текущего положения квадратика к положению, определяемому передаваемым параметром squarePosition;
 - setSquarePosition:animated:completionHandler: , в котором бы при animated = YES происходила анимация от текущего положения квадратика к положению, определяемому передаваемым параметром squarePosition, а по завершении вызывался бы completionHandler;
 - должен происходить проброс от более простого проперти в более сложное, вся логика должна быть реализована в setSquarePosition:animated:completionHandler:;
 - новое состояние squarePosition должно быть установлено только по окончании анимации;
 - если до окончания предыдущей анимации будет установлена новая анимация, то новая анимация должна начаться от текущего положения квадратика;
 5. В контроллере создать динамическую проперти, возвращающую объект класса вида или nil;
 6. Сделать метод, запускающий и останавливающий зацикленные переезды квадратика по четырем углам, используя методы вида.
*/
