import UIKit

//class Employee {
//    var name: String
//    init(name: String) {
//        self.name = name
//    }
//
//}
//protocol iOSEngineer {
//    func getiOSDetails()
//}
//protocol AndroidEngineer {
//    func getAndroidDetails()
//}
//
//extension iOSEngineer {
//    func getiOSDetails() {
//        print("I am an iOS engineer")
//    }
//}
//
//extension AndroidEngineer {
//    func getAndroidDetails() {
//        print("I am an Android engineer")
//    }
//}
//
//class IOSEmployee:Employee,iOSEngineer {
//}
//
//class AndroidEmployee:Employee,AndroidEngineer {
//}
//
//class HybridEngineer:Employee,iOSEngineer, AndroidEngineer {
//    
//}
//
//let engineer = HybridEngineer(name: "Rishabh")
//engineer.getiOSDetails()
//engineer.getAndroidDetails()

struct Employee {
    var name: String
}

protocol iOSEngineer {
    func getiOSDetails()
}

protocol AndroidEngineer {
    func getAndroidDetails()
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

struct IOSEmployee:iOSEngineer {
    var name: String
    init(name: String) {
        self.name = name
    }
}

struct AndroidEmployee:AndroidEngineer {
    var name: String
    init(name: String) {
        self.name = name
    }
}

struct HybridEngineer:iOSEngineer, AndroidEngineer {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let engineer = HybridEngineer(name: "Rishabh")
engineer.getiOSDetails()
engineer.getAndroidDetails()


