import UIKit

enum EngineState {
    case engineOn, engineOff
}

enum WindowState{
    case windowOpen, windowClosed
}

enum HeaterState{
    case heaterOn, heaterOff
}

enum SunroofState{
    case sunroofOpen, sunroofClosed
}
enum CarAction{
    case engineStart
    case engineStop
    case windowUp
    case windowDown
    case cargoLoad(Double)
    case cargoUnload(Double)
    case sunroofUp
    case sunroofDown
}

protocol Car {
    var model: String { get set }
    var year: Int { get set }
    var engine: EngineState { get set }
    var window: WindowState { get set }
    var heater: HeaterState { get set }
    func windowAction (_ state: WindowState)
}

extension Car {
    mutating func engineAction (_ state: EngineState){
        self.engine = state
    }
}

extension Car {
    mutating func heaterAction (_ state: HeaterState){
        self.heater = state
    }
}

class SportCar: Car {
    var model: String
    var year: Int
    var engine: EngineState
    var window: WindowState
    var heater: HeaterState
    var lapTime: Double
    var sunroof: SunroofState

    func windowAction(_ state: WindowState) {
        self.window = state
    }
    
    init (model: String, year: Int, engine: EngineState, window: WindowState, heater: HeaterState, lapTime: Double, sunroof: SunroofState){
        self.model = model
        self.year = year
        self.engine = engine
        self.window = window
        self.heater = heater
        self.lapTime = lapTime
        self.sunroof = sunroof
    }
}

class TrunkCar: Car {
    var model: String
    var year: Int
    var engine: EngineState
    var window: WindowState
    var heater: HeaterState
    var wheels: Int
    var trunkVolume: Double
    var filledTrunkVolume: Double

    func windowAction(_ state: WindowState) {
        self.window = state
    }
    init (model: String, year: Int, engine: EngineState, window: WindowState, heater: HeaterState, wheels: Int, trunkVolume: Double, filledTrunkVolume: Double){
        self.model = model
        self.year = year
        self.engine = engine
        self.window = window
        self.heater = heater
        self.wheels = wheels
        self.trunkVolume = trunkVolume
        self.filledTrunkVolume = filledTrunkVolume
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "SportCar Model: \(model), year: \(year), engine: \(engine), window: \(window), heater \(heater), lapTime \(lapTime), sunroof: \(sunroof)"
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "TrunkCar Model: \(model), year: \(year), engine: \(engine), window: \(window), heater \(heater), wheels: \(wheels), trunkVolume: \(trunkVolume), filled: \(filledTrunkVolume)"
    }
}

var sportCar1 = SportCar(model: "BMW", year: 2021, engine: .engineOff, window: .windowClosed, heater: .heaterOff, lapTime: 20.0, sunroof: .sunroofClosed)
var sportCar2: SportCar = SportCar(model: "Lada", year: 2021, engine: .engineOff, window: .windowOpen, heater: .heaterOff, lapTime: 100, sunroof: .sunroofOpen)

var trunkCar1: TrunkCar = TrunkCar(model: "MAN", year: 2020, engine: .engineOff, window: .windowClosed, heater: .heaterOff, wheels: 10, trunkVolume: 50.0, filledTrunkVolume: 0)
var trunkCar2: TrunkCar = TrunkCar(model: "Volvo", year: 2020, engine: .engineOff, window: .windowClosed, heater: .heaterOff, wheels: 12, trunkVolume: 100.0, filledTrunkVolume: 0)

sportCar1.windowAction(.windowOpen)
trunkCar2.heaterAction(.heaterOn)

print(sportCar1.description)
print(sportCar2.description)
print(trunkCar1.description)
print(trunkCar2.description)
