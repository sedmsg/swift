import UIKit

enum engineState {
    case engineOn
    case engineOff
}

enum windowState{
    case windowOpen
    case windowClosed
}

enum carAction{
    case engineStart
    case engineStop
    case windowUp
    case windowDown
    case cargoLoad(Double)
    case cargoUnload(Double)
}

struct sportCar {
    let brand: String       //марка авто
    let year: UInt        //год выпуска
    let trunkVolume: Double    //объем багажника
    var engine: engineState    //статус двигателя (заведен/заглушен)
    var window: windowState    //статус окон (опущены/подняты)
    var filledTrunkVolume: Double   //заполненный объем багажника
    mutating func handleAction (_ action:carAction){
        switch action {
            case .engineStart:
                self.engine = .engineOn
            case .engineStop:
                self.engine = .engineOff
            case .windowUp:
                self.window = .windowClosed
            case .windowDown:
                self.window = .windowOpen
            case .cargoLoad(let volume):
                if ((self.trunkVolume - self.filledTrunkVolume) >= volume) {
                    self.filledTrunkVolume += volume
                } else {
                    print("Load cargo error!")
                }
            case .cargoUnload(let volume):
                if (self.filledTrunkVolume >= volume){
                    self.filledTrunkVolume -= volume
                } else {
                    print("Unload cargo error!")
                }
        }
    }
}

struct TrunkCar {
    let brand: String       //марка авто
    let year: UInt        //год выпуска
    let trunkVolume: Double    //объем багажника
    var engine: engineState    //статус двигателя (заведен/заглушен)
    var window: windowState    //статус окон (опущены/подняты)
    var filledTrunkVolume: Double   //заполненный объем багажника
    mutating func handleAction (_ action:carAction){
        switch action {
            case .engineStart:
                self.engine = .engineOn
            case .engineStop:
                self.engine = .engineOff
            case .windowUp:
                self.window = .windowClosed
            case .windowDown:
                self.window = .windowOpen
            case .cargoLoad(let volume):
                if ((self.trunkVolume - self.filledTrunkVolume) >= volume) {
                    self.filledTrunkVolume += volume
                } else {
                    print("Load cargo error!")
                }
            case .cargoUnload(let volume):
                if (self.filledTrunkVolume >= volume){
                    self.filledTrunkVolume -= volume
                } else {
                    print("Unload cargo error!")
                }
        }
    }
}

var car1 = sportCar(brand: "Audi", year: 2020, trunkVolume: 20.0, engine: .engineOff, window: .windowClosed, filledTrunkVolume: 0.0)
var car2 = sportCar(brand: "BMW", year: 2019, trunkVolume: 20.0, engine: .engineOff, window: .windowClosed, filledTrunkVolume: 0.0)

var trunkCar1 = sportCar(brand: "MAN", year: 2020, trunkVolume: 100.0, engine: .engineOff, window: .windowClosed, filledTrunkVolume: 0.0)
var trunkCar2 = sportCar(brand: "Volvo", year: 2020, trunkVolume: 200.0, engine: .engineOff, window: .windowClosed, filledTrunkVolume: 0.0)

car1.handleAction(.engineStart)
car1.handleAction(.cargoLoad(10.0))
car2.handleAction(.cargoUnload(20.0))
trunkCar1.handleAction(.windowDown)
trunkCar2.handleAction(.cargoLoad(15.0))

print("Car 1: Model \(car1.brand), Year \(car1.year), trunk volume \(car1.trunkVolume), engine \(car1.engine), window \(car1.window), cargo \(car1.filledTrunkVolume)")
print("Car 2: Model \(car1.brand), Year \(car2.year), trunk volume \(car2.trunkVolume), engine \(car2.engine), window \(car2.window), cargo \(car2.filledTrunkVolume)")
print("Trunk Car 1: Model \(trunkCar1.brand), Year \(trunkCar1.year), trunk volume \(trunkCar1.trunkVolume), engine \(trunkCar1.engine), window \(trunkCar1.window), cargo \(trunkCar1.filledTrunkVolume)")
print("Trunk Car 2: Model \(trunkCar2.brand), Year \(trunkCar2.year), trunk volume \(trunkCar2.trunkVolume), engine \(trunkCar2.engine), window \(trunkCar2.window), cargo \(trunkCar2.filledTrunkVolume)")

