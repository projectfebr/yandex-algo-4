//
//  c.swift
//  yandex-algo-4
//
//  Created by Александр Болотов on 02.11.2023.
//

import Foundation

func c() {
    // input
    let read4IntegerFromConsole: () -> (Int, Int, Int, Int) = {
        let arr = readLine()!.split(separator: " ").compactMap { Int($0)! }
        return (arr[0], arr[1], arr[2], arr[3])
    }
    let (Xa, Ya, Xb, Yb) = read4IntegerFromConsole()

    // 1 - точки не одинаковые
    if Xa != Xb || Ya != Yb {
        let Ra = sqrt(Double((Xa * Xa) + (Ya * Ya)))
        let Rb = sqrt(Double((Xb * Xb) + (Yb * Yb)))
        // расcтояние и направление которое нужно пройти до целевой окружности
        let delta = abs(Ra) - abs(Rb)
        // в завимисомти от направления движения (ОТ или К центру) определяется по какой окружности будем двигаться
        let R = Rb > Ra ? Ra : Rb

        // проверяем не противопложные ли сектора
        if ((Ya >= 0 && Yb >= 0) || (Ya <= 0 && Yb <= 0)) || ((Xa >= 0 && Xb >= 0) || (Xa <= 0 && Xb <= 0))
        {
            // 3 - вычисляем путь движения по диаметру
            var arctanA: Double = 0
            var arctanB: Double = 0
            if Ya >= 0 && Yb >= 0 {
                arctanA = atan2(Double(Xa), Double(Ya))
                arctanB = atan2(Double(Xb), Double(Yb))
            } else {
                arctanA = atan2(Double(Ya), Double(Xa))
                arctanB = atan2(Double(Yb), Double(Xb))
            }
            let l = abs(R * abs(arctanA - arctanB) + abs(delta))
            print(min(Ra + Rb, l))
        } else {
            // если сектора противоположные то 100% идем через центр
            print(Ra + Rb)
        }
    } else {
        print(0)
    }
}

/*

 Мэрия Москвы основательно подготовилась к празднованию тысячелетия города в 2147 году, построив под столицей бесконечную асфальтированную площадку, чтобы заменить все существующие в городе автомобильные дороги. В память о кольцевых и радиальных дорогах разрешили двигаться по площадке только двумя способами:

 В сторону точки начала координат или от неё. При этом из точки начала координат разрешено двигаться в любом направлении.
 Вдоль окружности с центром в начале координат и радиусом, который равен текущему расстоянию до начала координат. Двигаться вдоль такой окружности разрешается в любом направлении (по или против часовой стрелки).
 Вам, как ведущему программисту ответственной инстанции поручено разработать модуль, который будет определять кратчайший путь из точки A, с координатами (xA, yA) в точку B с координатами (xB, yB). Считайте, что менять направление движения можно произвольное количество раз, но оно должно всегда соответствовать одному из двух описанных выше вариантов.

 Формат ввода
 В первой строке ввода заданы четыре целых числа xA, yA, xB и yB, по модулю не превосходящие 106.

 */
