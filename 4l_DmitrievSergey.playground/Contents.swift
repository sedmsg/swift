import UIKit

enum engineState {
    case engineOn
    case engineOff
}

enum windowState{
    case windowOpen
    case windowClosed
}

enum sunroofState{
    case sunroofOpen
    case sunroofClosed
}
enum carAction{
    case engineStart
    case engineStop
    case windowUp
    case windowDown
    case cargoLoad(Double)
    case cargoUnload(Double)
    case sunroofUp
    case sunroofDown
}

class Car {
    var model: String
    var year: Int
    var engine: engineState
    var window: windowState
    
    init (model: String, year: Int, engine: engineState, window: windowState){
        self.model = model
        self.year = year
        self.engine = engine
        self.window = window
    }
    
    func handleAction (action: carAction) {
        
    }
}

class SportCar: Car {
    var lapTime: Double
    var sunroof: sunroofState
    
    init (model: String, year: Int, engine: engineState, window: windowState, lapTime: Double, sunroof: sunroofState){
        self.lapTime = lapTime
        self.sunroof = sunroof
        super.init(model: model, year: year, engine: engine, window: window)
    }
    
    override func handleAction(action: carAction) {
        switch action {
        case .engineStart:
            self.engine = .engineOn
        case .engineStop:
            self.engine = .engineOff
        case .windowUp:
            self.window = .windowClosed
        case .windowDown:
            self.window = .windowOpen
        case .sunroofUp:
            self.sunroof = .sunroofClosed
        case .sunroofDown:
            self.sunroof = .sunroofOpen
        default:
            print("Action \(action) don't support for SportCar")
        }
    }
}

class TrunkCar: Car {
    var wheels: Int
    var trunkVolume: Double
    var filledTrunkVolume: Double
    
    init (model: String, year: Int, engine: engineState, window: windowState, wheels: Int, trunkVolume: Double, filledTrunkVolume: Double){
        self.wheels = wheels
        self.trunkVolume = trunkVolume
        self.filledTrunkVolume = filledTrunkVolume
        super.init(model: model, year: year, engine: engine, window: window)
    }
    
    override func handleAction(action: carAction) {
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
            if (self.trunkVolume - self.filledTrunkVolume) >= volume {
                self.filledTrunkVolume += volume
            } else {
                print("Cargo load error")
            }
        case .cargoUnload(let volume):
            if self.filledTrunkVolume >= volume {
                self.filledTrunkVolume -= volume
            } else {
                print("Cargo unload error")
            }
        default:
            print("Action \(action) don't support for TrunkCar")
        }
    }
}

var sportCar1: SportCar = SportCar(model: "BMW", year: 2020, engine: .engineOff, window: .windowClosed, lapTime: 20, sunroof: .sunroofClosed)
var sportCar2: SportCar = SportCar(model: "Lada", year: 2021, engine: .engineOff, window: .windowOpen, lapTime: 100, sunroof: .sunroofOpen)

var trunkCar1: TrunkCar = TrunkCar(model: "MAN", year: 2020, engine: .engineOff, window: .windowClosed, wheels: 10, trunkVolume: 50.0, filledTrunkVolume: 0)
var trunkCar2: TrunkCar = TrunkCar(model: "Volvo", year: 2020, engine: .engineOff, window: .windowClosed, wheels: 12, trunkVolume: 100.0, filledTrunkVolume: 0)

sportCar1.handleAction(action: .engineStart)
sportCar1.handleAction(action: .sunroofUp)
sportCar2.handleAction(action: .windowDown)
sportCar2.handleAction(action: .cargoLoad(20))
trunkCar1.handleAction(action: .engineStart)
trunkCar1.handleAction(action: .sunroofUp)
trunkCar2.handleAction(action: .windowDown)
trunkCar2.handleAction(action: .cargoLoad(20))

print("SportCar1 Model: \(sportCar1.model), year: \(sportCar1.year), engine: \(sportCar1.engine), window: \(sportCar1.window), lapTime \(sportCar1.lapTime), sunroof: \(sportCar1.sunroof)")
print("SportCar2 Model: \(sportCar2.model), year: \(sportCar2.year), engine: \(sportCar2.engine), window: \(sportCar2.window), lapTime \(sportCar2.lapTime), sunroof: \(sportCar2.sunroof)")
print("TrunkCar 1 Model: \(trunkCar1.model), year: \(trunkCar1.year), engine: \(trunkCar1.engine), window: \(trunkCar1.window), wheels: \(trunkCar1.wheels), trunkVolume: \(trunkCar1.trunkVolume), filled: \(trunkCar1.filledTrunkVolume)")
print("TrunkCar 2 Model: \(trunkCar2.model), year: \(trunkCar2.year), engine: \(trunkCar2.engine), window: \(trunkCar2.window), wheels: \(trunkCar2.wheels), trunkVolume: \(trunkCar2.trunkVolume), filled: \(trunkCar2.filledTrunkVolume)")
