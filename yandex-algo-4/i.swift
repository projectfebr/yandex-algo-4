//
//  i.swift
//  yandex-algo-4
//
//  Created by Александр Болотов on 03.11.2023.
//

import Foundation

func i() {
    let input = readLine()!
    let dict: [Character: Int] = ["(": 1, ")": -1, "[": 2, "]": -2, "{": 3, "}": -3]
    var stack: [Int] = []

    let result = input.reduce(true, { result, char in
        let code = dict[char]!
        if code > 0 {
            push(elem: code)
            return result
        } else {
            guard !stack.isEmpty, let popCode = pop(), popCode + code == 0
            else { return result && false }
            return result
        }
    })

    print(result && stack.isEmpty ? "yes" : "no")

    func push(elem: Int) {
        stack.append(elem)
    }

    func pop() -> Int? {
        stack.removeLast()
    }
}

/*
 Рассмотрим последовательность, состоящую из круглых, квадратных и фигурных скобок. Программа должна определить, является ли данная скобочная последовательность правильной. Пустая последовательность является правильной. Если A — правильная, то последовательности (A), [A], {A} — правильные. Если A и B — правильные последовательности, то последовательность AB — правильная.

 Формат ввода
 В единственной строке записана скобочная последовательность, содержащая не более 100000 скобок.

 Формат вывода
 Если данная последовательность правильная, то программа должна вывести строку "yes", иначе строку "no".
 */
