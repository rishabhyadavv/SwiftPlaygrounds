import UIKit

//This principle states that no client should be forced to depend on methods it does not use.Example:

// Incorrect implementation violating ISP
protocol Worker {
    func work()
    func takeBreak()
}

class Programmer: Worker {
    func work() {
        print("Writing code")
    }

    func takeBreak() {
        print("Taking a break")
    }
}


//In this example, the Programmer class implements both work() and takeBreak(), but not all workers need to take breaks. It's better to split the protocol into smaller, more specific protocols.
//Let\s break this


protocol Work {
    func work()
}

protocol Break {
    func takeBreak()
}

class Programmer1: Work {
    func work() {
        print("Writing code")
    }
}

class Programmer2: Break {
    func takeBreak() {
        print("Writing code")
    }
}

