//
//  f.swift
//  yandex-algo-4
//
//  Created by Александр Болотов on 04.11.2023.
//

import Foundation

func f() {
    let readIntegerFromConsole: () -> Int = {
        let number = Int(readLine()!)!
        return number
    }
    
    let k = readIntegerFromConsole()
    let n = readIntegerFromConsole()
    var a: [UInt64] = []
    var all: UInt64 = 0
    var result: UInt64 = 0
    var last = 0
    var kCurrent: UInt64 = 0
    
    for i in 0..<n {
        let current = readIntegerFromConsole()
        a.append(UInt64(current))
        all += UInt64(current)
        if current != 0 { last = i }
    }
    
    while all != 0 {
        if a[last] % UInt64(k) == 0 {
            // лифт заполнился
            result += (a[last] / UInt64(k)) * 2 * (UInt64(last) + 1)
            all -= a[last]
            a[last] = 0
            // теперь нужно высчитать следующий этаж с людьми
            last = getLastFrom(current: last)
        } else {
            // лифт не заполнится в последней итерации
            result += ((a[last] / UInt64(k)) + 1) * 2 * (UInt64(last) + 1)
            all = all + a[last] % UInt64(k) - a[last]
            a[last] = a[last] % UInt64(k)
            
            kCurrent = a[last] % UInt64(k)
            all -= a[last]
            a[last] = 0
            
            // теперь по пути нужно еще подобарть "бесплатных" пассажиров
            while all != 0 && kCurrent < k && last > 0 {
                last = getLastFrom(current: last)
                let freeSpace = UInt64(k) - kCurrent
                if a[last] > freeSpace {
                    kCurrent += freeSpace
                    a[last] -= freeSpace
                    all -= freeSpace
                } else {
                    kCurrent += a[last]
                    all -= a[last]
                    a[last] = 0
                }
            }
        }
    }
    
    print(result)
    
    func getLastFrom(current: Int) -> Int {
        var last = current
        while last > 0 {
            last -= 1
            if a[last] > 0 {
                return last
            }
        }
        return -1
    }
}
