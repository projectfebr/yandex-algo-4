//
//  e.swift
//  yandex-algo-4
//
//  Created by Александр Болотов on 02.11.2023.
//

import Foundation

func e() {
    let n = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").compactMap { Int($0)! }
    
    var result: [Int] = []
    
    result.append(arr.reduce(0, +) - (arr[0] * n))
    
    var i = 1
    
    while i != n {
        result.append(result[i-1] - (arr[i] - arr[i-1])*(n-i) + (arr[i] - arr[i-1])*i)
        i += 1
    }
    
    print(result.map { String($0) }.joined(separator: " "))
}
