import UIKit

//Задание 1 - решить квадратное уравнение
//ax2 + bx + c = 0
let a: Float = 5
let b: Float = 55
let c: Float = 55

let D: Float = b*b - 4*a*c

var x1: Float = 0
var x2: Float = 0

if D < 0 {
    print("D < 0, действительных корней нет")
} else if D == 0 {
    x1 = -b / (2*a)
    print("D = 0, уравнение имеет один корень x = \(x1)")
} else {
    x1 = (-b + sqrt(D))/(2*a)
    x2 = (-b - sqrt(D))/(2*a)
    print("D > 0, x1 = \(x1), x2 = \(x2)")
}

//2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
//Катеты - side_a, side_b, гипотенуза - side_c
let sideA: Float = 10
let sideB: Float = 10
let sideC: Float = sqrt(sideA*sideA + sideB*sideB)
let S: Float = 0.5 * sideB * sideB
let P: Float = sideA + sideA + sideC

print("Параметры треугольника: площадь - \(S), периметр - \(P), гипотенуза - \(sideC)")

//3. *Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
let deposit: Float = 100
let percent: Float = 6
let years = 5

var depositFinal: Float = deposit
var depositFinalWithCapitalization: Float = deposit

for index in 1...years {
    depositFinal += deposit * percent/100
    depositFinalWithCapitalization += depositFinalWithCapitalization * percent/100
    print("Год \(index): сумма на вкладе - \(depositFinal), сумма на вкладе с капитализацией - \(depositFinalWithCapitalization)")
}
print ("Доход: \(depositFinal-deposit), с капитализацией: \(depositFinalWithCapitalization-deposit)")
