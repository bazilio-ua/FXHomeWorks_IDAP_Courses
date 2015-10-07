//
//  main.m
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/19/15.
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
 Задание 2.
 Написать UI приложение в один вид:
 1. Данные - рандомные данные строковые (сгенерированные в процессе первого старта приложения) + изображение (одно на все ячейки, считываемое из файловой системы);
 2. Представление для данных - таблица;
 3. В таблице должна присутствовать возможность пересортировывать строки, добавлять новые, заполненные рандомом и удалять старые;
 4. Необходимо написать модель и модель массива, модель массива должна быть наблюдаемой и должна удовлетворять следующим требованиям:
 - доступ по индексам;
 - доступ по литералу индекса;
 - работа как с моделями, так и с индексами моделей;
 - возможность получить количество;
 5. Необходимо создать конвенции по использованию методов и сами методы в определенных иерархиях классов с помощью категорий и общих абстрактных родителей для переиспользования в этом и других проектах, которые бы обеспечивали следующее:
 - получение объекта с конкретным типом из ниба используя UINib;
 - получение объекта с конкретным типом из ниба используя NSBundle;
 - получение переиспользуемой ячейки из таблицы с конкретным типом;
 - получение переиспользуемой ячейки из таблицы или создание новой в случае, когда переиспольземые ячейки недоступны с конкретным типом;
 - создание окна с размерами, равными размеру экрана;
 - создание нового вьюконтроллера с дефолтным именем ниба и нулевым бандлом;
 - reuseIdentifier ячейки, завязанный на имя класса ячейки.
 5. Требования к контроллеру:
 - должен позволять установить модель извне (в случае данного приложения модель должны быть передана из AppDelegate), при этом необходимо учесть следующие ситуации при установке модели извне:
 а. у контроллера еще не создан вид;
 б. У контроллера создан вид.
 - процесс добавления/удаления контроллера в качестве наблюдателя модели должен быть автоматизированным в пределах контроллера;
 - процесс добавления и удаления ячейки должен быть анимированным через наблюдение за состоянием массива моделей.
 6. Внешний вид всех видов, включая ячейки таблицы должен быть задан в нибах.
*/

/*
 Задание 3.
 1. Сохранять состояние между запусками приложения используя NSCoding и сериализацию массива моделей в плист в файловой системе при следующих событиях:
 - приложение уходит в бекграунд;
 - приложение умирает;
 2. Загружать состояние приложения асинхронно, сначала показав вид с загрузкой, а потом таблицу;
 3. Вид загрузки должен отвечать следующим требованиям:
 - должен уметь появляться и исчезать анимированно через изменение альфы;
 - должен быть задан в отдельном нибе;
 - должен иметь метод создания, который бы автоматически прикреплял его к какому-то виду;
 - должен затемнять экран приложения;
 4. Загружать картинку асинхронно в каждой из моделей ячеек, наблюдать из ячеек за состоянием модели и обновлять себя соответствующим образом (пока грузим - спиннер, загрузили - данные);
 5. Создать абстрактную родительскую модель, отвечающую следующим требованиям:
 - обеспечивает переход между потоками;
 - дает точки перегрузки для бекграундной обработки загрузки;
 - сгенерировано несколько typedef состояний, отвечающих за разные состояния загрузки модели;
 - сгенерирован протокол нотификации наблюдателей о различных состояниях;
 - есть методы для нотификации наблюдателей о разных состояниях модели;
 - при загрузке уже загруженной модели повторная загрузка происходить не должна;
 - при загрузке уже загруженной модели должна происходить нотификация о том, что модель загружена;
 - нужно также учесть, что полноценной автоматизации всех переходов при обработке данных и нотификаций сделать не выйдет, т.к.операции могут быть не только синхронными (как в упражнении 7 первого блока) так и асинхронными, соответственно, добавить нужные возможности для завершения процесса обработки в наследниках класса;
 6. Переработать модели так, чтобы они были унаследованы от абстрактной родительской модели.
 */
