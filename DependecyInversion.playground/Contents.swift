import UIKit


//In the incorrect example, the Car class directly depends on PetrolEngine, violating DIP because it's tightly coupled to a specific implementation.
// We can solve the same with the help of dependency injection
//class PetrolEngine {
//    func start() {
//        print("Petrol engine started.")
//    }
//}
//
//class ElectricEngine {
//    func start() {
//        print("Electric engine started.")
//    }
//}
//
//class Car {
//    let petrolEngine = PetrolEngine()
//    
//    func start() {
//        petrolEngine.start()
//        print("Car started.")
//    }
//}


protocol Engine {
    func start()
}

class PetrolEngine: Engine {
    func start() {
        print("Petrol engine started.")
    }
}

class ElectricEngine: Engine {
    func start() {
        print("Electric engine started.")
    }
}

class Car {
    let engine: Engine
    
    init(engine: Engine) {
        self.engine = engine
    }
    
    func start() {
        engine.start()
        print("Car started.")
    }
}

let petrolCar = Car(engine: PetrolEngine())
petrolCar.start()

let dieselCar = Car(engine: PetrolEngine())
dieselCar.start()
