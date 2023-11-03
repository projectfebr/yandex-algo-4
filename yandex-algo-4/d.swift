//
//  в.swift
//  yandex-algo-4
//
//  Created by Александр Болотов on 03.11.2023.
//

import Foundation

func d() {
    let a = readLine()!
    let b = readLine()!

    var dictA: [Character: Int] = [:]
    for char in a {
        if dictA[char] != nil {
            dictA[char]! += 1
        } else {
            dictA[char] = 1
        }
    }

    var dictB: [Character: Int] = [:]
    for char in b {
        if dictB[char] != nil {
            dictB[char]! += 1
        } else {
            dictB[char] = 1
        }
    }

    print(dictA == dictB ? "YES" : "NO")
}

/*
 Задано две строки, нужно проверить, является ли одна анаграммой другой. Анаграммой называется строка, полученная из другой перестановкой букв.

 Формат ввода
 Строки состоят из строчных латинских букв, их длина не превосходит 100000. Каждая записана в отдельной строке.

 Формат вывода
 Выведите "YES" если одна из строк является анаграммой другой и "NO" в противном случае.
 */
