import UIKit

protocol Weightabe {
    var weight: Double { get set }
}
class Circle:  Weightabe{
    var radius: Double
    var weight: Double
    func calculatePerimeter() -> Double {
        return 2.0 * Double.pi * radius
    }
    init(radius: Double, weight: Double){
        self.radius = radius
        self.weight = weight
    }
}
class Rectangle: Weightabe {
    var sideA: Double
    var sideB: Double
    var weight: Double
    func calculatePerimetr() -> Double {
        return 2*(sideA + sideB)
    }
    init(sideA: Double, sideB: Double, weight: Double){
        self.sideA = sideA
        self.sideB = sideB
        self.weight = weight
    }
}
class Triangle: Weightabe {
    var sideA: Double
    var sideB: Double
    var sideC: Double
    var weight: Double
    func calculatePerimetr() -> Double {
        return sideA + sideB + sideC
    }
    init(sideA: Double, sideB: Double, sideC: Double, weight: Double){
        self.sideA = sideA
        self.sideB = sideB
        self.sideC = sideC
        self.weight = weight
    }
}

struct Queue<T: Weightabe>{
    private var elements: [T] = []
    
    var isEmpty: Bool {
        return elements.count == 0
    }
    mutating func push (_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        return elements.removeFirst()
    }
    var totalWeight: Double {
        var weight = 0.0
        for element in elements {
            weight += element.weight
        }
        return weight
    }
    
    subscript (indicies: UInt ...) -> Double? {
        var weight: Double = 0
        for index in indicies {
            if (index < self.elements.count){
                weight += self.elements[Int(index)].weight
            } else {
                return nil
            }
        }
        return weight
    }
}

extension Queue {
    func filter (predicate: (T)->Bool) -> [T] {
        var result = [T]()
        for index in elements {
            if predicate(index) {
                result.append(index)
            }
        }
        return result
    }
    func forEach (predicate: (T)->()) {
        for index in elements {
            predicate(index)
        }
    }
}

var queueRectangle = Queue<Rectangle>()
var queueCircle = Queue<Circle>()
var queueTriangle = Queue<Triangle>()

queueCircle.push(Circle(radius: 10, weight: 3))
queueCircle.push(Circle(radius: 5, weight: 4))

queueCircle[0,1,2]

queueCircle.filter {$0.weight > 2}
queueCircle.forEach(predicate: {print($0.weight)})

queueCircle.isEmpty

queueCircle.pop()
queueCircle.pop()
queueCircle.isEmpty
