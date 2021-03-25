import UIKit

enum HandBrakeState {
    case handBrakeOn, handBrakeOff
}
enum EngineState{
    case engineOn, engineOff
}
enum TransmissionState{
    case neutral, drive
}
enum CarError: Error {
    case outOfFuel, handBrakeIsOn, engineIsOff, checkEngine
}

class Car{
    var fuelLevel: Double
    var engine: EngineState
    var handBrake: HandBrakeState
    var transmission: TransmissionState
                    
    func engineHandle(state: EngineState) throws -> (){
        guard fuelLevel > 0 else {
            throw CarError.outOfFuel
        }
        self.engine = state
    }

    func transmissionHandle(state: TransmissionState) throws -> () {
        guard handBrake == .handBrakeOff else {
            throw CarError.handBrakeIsOn
        }
        guard engine == .engineOn else {
            throw CarError.engineIsOff
        }
        self.transmission = state
        
    }

    init(fuelLevel: Double, engine: EngineState, handBrake: HandBrakeState, transmission: TransmissionState){
        self.fuelLevel = fuelLevel
        self.engine = engine
        self.handBrake = handBrake
        self.transmission = transmission
    }
}

func driving(car : Car) throws -> (){
    try car.transmissionHandle(state: .drive)
    guard Int.random(in: 1...2) == 1  else {
        throw CarError.checkEngine
    }
}

var testCar = Car(fuelLevel: 0, engine: .engineOff, handBrake: .handBrakeOn, transmission: .neutral)
do {
    
    testCar.handBrake = .handBrakeOff
    testCar.fuelLevel = 100
    try testCar.engineHandle(state: .engineOn)
    
    try driving(car: testCar)
    print("Driving ok!")
} catch CarError.outOfFuel {
    print("Закончилось топливо")
} catch CarError.handBrakeIsOn {
    print("Поднят ручник")
} catch CarError.engineIsOff {
    print("Двигатель заглушен")
} catch CarError.checkEngine {
    print("Проверьте двигатель!")
}
