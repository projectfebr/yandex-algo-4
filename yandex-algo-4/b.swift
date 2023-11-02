//
//  b.swift
//  yandex-algo-4
//
//  Created by Александр Болотов on 02.11.2023.
//

import Foundation

// start 12:18
// finish

func b() {
    // input
    let read4IntegerFromConsole: () -> (Int, Int, Int, Int) = {
        let arr = readLine()!.split(separator: " ").compactMap { Int($0)! }
        return (arr[0], arr[1], arr[2], arr[3])
    }
    let (a, b, c, d) = read4IntegerFromConsole()

    // calc m/n
    let m = (a * d) + (c * b)
    let n = b * d

    let gcdMN = gcd(max(m, n), min(m, n))

    func gcd(_ first: Int, _ second: Int) -> Int {
        let r: Int = first % second
        if r != 0 {
            return gcd(second, r)
        } else {
            return second
        }
    }

    print("\(m / gcdMN) \(n / gcdMN)")
}

/*

 Даны две рациональные дроби: a/b и c/d. Сложите их и результат представьте в виде несократимой дроби m/n.

 Формат ввода
 Программа получает на вход 4 натуральных числа a, b, c, d, каждое из которых не больше 100.

 Формат вывода
 Программа должна вывести два натуральных числа m и n такие, что m/n=a/b+c/d и дробь m/n – несократима.

 */
