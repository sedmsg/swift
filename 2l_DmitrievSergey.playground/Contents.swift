import UIKit

//1. Написать функцию, которая определяет, четное число или нет.
func checkEven (_ number: Int) -> Bool {
    if (number % 2) == 0 {
        return true
    } else {
        return false
    }
}

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func checkDiv3 (_ number: Int) -> Bool {
    if (number % 3) == 0 {
        return true
    } else {
        return false
    }
}
//3. Создать возрастающий массив из 100 чисел.
var numbers = [Int]();
for index in 0..<100 {
    numbers.append(index)
}
print(numbers)

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
var index = 0
while (index < numbers.count){
    if (checkEven(numbers[index])||(!checkDiv3(numbers[index]))){
        numbers.remove(at: index);
    } else {
        index+=1
    }
}
print(numbers)

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
func addFibonachiNumber(_ numbers: inout [Int]){
    if (numbers.count >= 2){
        numbers.append(numbers[numbers.count-2] + numbers[numbers.count-1]);
    }
}

var fibonachiNumbers = [0,1]
for _ in 0..<50 {
    addFibonachiNumber(&fibonachiNumbers)
}
print(fibonachiNumbers)

//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно.

var primeNumbers = [Int]();
var primeNumbersCheck = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97];
var p = 2
var n = 100
var indexNumbers = p
for index in 2...n{
    primeNumbers.append(index);
}
while(indexNumbers < primeNumbers.count){
    while(indexNumbers < primeNumbers.count){
        primeNumbers[indexNumbers] = 0
        indexNumbers += p
    }
    for index in 0...n-2 {
        if (p < primeNumbers[index]) {
            p = primeNumbers[index]
            indexNumbers = index + p
            //print(p)
            break
        }
    }
}
indexNumbers = 0
while (indexNumbers < primeNumbers.count){
    if (primeNumbers[indexNumbers] == 0){
        primeNumbers.remove(at: indexNumbers);
    } else {
        indexNumbers += 1
    }
}
if (primeNumbersCheck == primeNumbers){
    print("Congratulations!")
}
