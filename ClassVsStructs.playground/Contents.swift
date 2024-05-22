import UIKit
//
//class Person {
//    var name: String
//    var age: Int
//    
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//}
//
//struct StructPerson {
//    var name: String
//    var age: Int
//}
//
//var person1 = Person(name: "John", age: 30)
//var person2 = person1 // Both person1 and person2 reference the same instance in memory
//person2.name = "Alice"
//print(person1.name) // Outputs: Alice
//
//class Animal {
//    var species: String
//    
//    init(species: String) {
//        self.species = species
//    }
//    
//   func getSpecies()-> String {
//       return self.species
//        
//    }
//}
//
//class Dog: Animal {
//    var breed: String
//    
//    init(breed: String) {
//        self.breed = breed
//        super.init(species: "Dog")
//    }
//}
//
//let dogInstance = Dog(breed: "new")
//dogInstance.getSpecies()
//
//
//struct Point {
//    var x: Int
//    var y: Int
//}
//
//var point1 = Point(x: 1, y: 2)
//var point2 = point1 // point2 is a copy of point1
//point2.x = 5
//print(point1.x) // Outputs: 1
//
//protocol Vehicle {
//    var numberOfWheels: Int { get }
//    func start()
//}
//
//extension Vehicle {
//    func start() {
//        print("Engine started")
//    }
//}
//
//struct Car: Vehicle {
//    let numberOfWheels: Int = 4
//}
//
//struct Motorcycle: Vehicle {
//    let numberOfWheels: Int = 2
//}
//
//let car = Car()
//let motorcycle = Motorcycle()
//
//car.start() // Outputs: Engine started
//motorcycle.start() // Outputs: Engine started


class Employee {
    var name: String
    init(name: String) {
        self.name = name
    }

}

protocol Engineer {
    func getDetails()
}

protocol iOSEngineer {
    func getDetails()
}
protocol AndroidEngineer {
    func getDetails()
}

extension iOSEngineer {
    func getiOSDetails() {
        print("I am an iOS engineer")
    }
}

extension AndroidEngineer {
    func getAndroidDetails() {
        print("I am an Android engineer")
    }
}

class IOSEmployee:Employee,iOSEngineer {
    func getLanguageExpertise() {
      print("swift")
    }

}

class AndroidEmployee:Employee,AndroidEngineer {
    func getLanguageExpertise() {
      print("java")
    }
}

class HybridEngineer:Employee,iOSEngineer, AndroidEngineer {
   
//     func getiOSDetails() {
//        print("I am an iOS engineer")
//    }
//    
//     func getAndroidDetails() {
//        print("I am an Android engineer")
//    }
    
}

//
let engineer = HybridEngineer(name: "Rishabh")
engineer.getiOSDetails()
engineer.getAndroidDetails()


