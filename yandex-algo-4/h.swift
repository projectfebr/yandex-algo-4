//
//  h.swift
//  yandex-algo-4
//
//  Created by Александр Болотов on 03.11.2023.
//

import Foundation

func h() {
    let readIntegerFromConsole: () -> Int = {
        let number = Int(readLine()!)!
        return number
    }

    let a = readIntegerFromConsole()
    let b = readIntegerFromConsole()
    let n = readIntegerFromConsole()

    let maxStundetsInA = a
    let minStudentsInB = b % n == 0 ? (b / n) : (b / n) + 1

    maxStundetsInA > minStudentsInB ? print("YES") : print("NO")
}

/*
 Чтобы оценить качество обучения программированию, в каждой группы студентов подсчитывается один параметр — суммарное количество решенных студентами задач.

 Известно, что в первой группе суммарное количество решенных на контесте задач равно a, а во второй — b. Всего на контесте было предложено n задач, а также известно, что каждый студент решил не менее одной (и не более n) задач.

 По заданным a, b и n определите, могло ли в первой группе быть строго больше студентов, чем во второй.

 Формат ввода
 Вводятся три целых числа a, b, n (1 ≤ a, b, n ≤ 10000).

 Формат вывода
 Выведите "Yes" если в первой группе могло быть строго больше студентов, чем во второй, и "No" в противном случае.
 */
