import UIKit

protocol UserSaveToDBImp {
    func saveToDB(email: String, name:String)
}

protocol UserEmailImp {
    func sendEmail(message: String)
}

class HandleUserDatabase : UserSaveToDBImp {
    func saveToDB(email: String, name: String) {
        print("data is", email, name)
    }
}

class HandleUserEmail : UserEmailImp {
    func sendEmail(message: String) {
        print("message is", message)
    }
}

class User {
    var email: String
    var name: String
    // This is a tight coupling, please handle this with dependency injection
    // 5. Dependency Inversion Principle (DIP)

    init(email: String, name:String) {
        self.email  = email
        self.name = name
    }
    
    //ANS : Now if we want to have fetch user functionality then we will create a protocol and a service class that inherit protofcol and the use here.
}

class Supserwiser: User {
    var dataBaseService: HandleUserDatabase
    var emailService: HandleUserEmail
    
    init(email: String, name:String,dataBaseService:HandleUserDatabase, emailService:HandleUserEmail) {
        self.dataBaseService = dataBaseService
        self.emailService = emailService
        super.init(email: email, name: name)

    }
    
    func saveUserDetails() {
        dataBaseService.saveToDB(email: email, name: name)
    }

    func sendEmail(message: String) {
        emailService.sendEmail(message: message)
    }
}

class Guards: User {
    
    var dataBaseService: HandleUserDatabase
    
    init(email: String, name:String,dataBaseService:HandleUserDatabase) {
        self.dataBaseService = dataBaseService
        super.init(email: email, name: name)

    }
    
    func saveUserDetails() {
        dataBaseService.saveToDB(email: email, name: name)
    }
    
}

let dataBaseService = HandleUserDatabase()
let emailService = HandleUserEmail()

var user = Supserwiser(email: "rrishuyadav@gmail.com", name: "Rishabh", dataBaseService: dataBaseService, emailService: emailService)
user.saveUserDetails()
user.sendEmail(message: "Hello testing")

let guardss = Guards(email: "deepak@gmail.com", name: "Deepak", dataBaseService: dataBaseService)
guardss.saveUserDetails()
// We can see that now gurads doe not ahve access to send email method.

//user = guardss
// solve this
//user.sendEmail(message: "hello deepak")


//Solve LSP problem by defining protocols

protocol Fly {
    func fly()
}

extension Fly {
    func fly() {
        print("The bird is flying")
    }
}

protocol Move {
    func move()
}

extension Move {
    func move() {
        print("The bird is moving")
    }
}

class Penguin:Move  {
   
}

class Parrot:Move, Fly  {
   
}

var parrot = Parrot()
let penguin = Penguin()
parrot.fly()
parrot.move()
penguin.move()

/*4. Interface Segregation Principle (ISP)
Problem:
Clients should not be forced to depend on interfaces they do not use. Instead of one fat interface, many small interfaces are preferred based on groups of methods with specific tasks.*/
protocol Worker {
func work()
func eat()
}

class Human: Worker {
func work() {
    print("Human working")
}

func eat() {
    print("Human eating")
}
}

class Robot: Worker {
func work() {
    print("Robot working")
}

func eat() {
    // Robots don't eat
}
}
