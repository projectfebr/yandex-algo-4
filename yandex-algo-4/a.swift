//
//  a.swift
//  yandex-algo-4
//
//  Created by Александр Болотов on 01.11.2023.
//

import Foundation

func a() {
    // input
    let readTwoIntegerFromConsole: () -> (Int, Int) = {
        let arr = readLine()!.components(separatedBy: " ").compactMap { Int($0)! }
        return (arr.first!,arr.last!)
    }
    
    let (n, m) = readTwoIntegerFromConsole()
    let a = readLine()!.components(separatedBy: " ")[0..<n].compactMap { Int($0)! }
    
    
    // calculating
    for _ in 0 ..< m {
        let (l, r) = readTwoIntegerFromConsole()
        let set = Set(a[l...r])
        if set.count > 1  {
            // может можно как-то эффективнее и без перевода в массив
            let arrayMeSet = Array(set)
            arrayMeSet[0] > arrayMeSet[1]
            ? print(arrayMeSet[0])
            : print(arrayMeSet[1])
        } else {
            print("NOT FOUND")
        }
    }
}

/*

 Задана последовательность целых чисел a1, a2, …, an. Задаются запросы: сказать любой элемент последовательности на отрезке от L до R включительно, не равный минимуму на этом отрезке.

 Формат ввода
 В первой строке содержатся два целых числа N, 1 ≤ N ≤ 100 и M, 1 ≤ M ≤ 1000 — длина последовательности и количество запросов соответственно.

 Во второй строке — сама последовательность, 0 ≤ ai ≤ 1000.

 Начиная с третьей строки перечисляются M запросов, состоящих из границ отрезка L и R, где L, R - индексы массива, нумеруются с нуля.

 Формат вывода
 На каждый запрос выведите в отдельной строке ответ — любой элемент на [L, R], кроме минимального. В случае, если такого элемента нет, выведите "NOT FOUND".

 */
