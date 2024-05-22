import UIKit


// 1. Creational design Patterns
// A. Singlteon

/*Ensures that a class has only one instance and provides a global point of access to it.*/

// B. Factory design Patterns
/* Defines an interface for creating an object but allows subclasses to alter the type of objects that will be created */

// 2. Structural Patterns:
// A. Facade
/* Provides a unified interface to a set of interfaces in a subsystem, simplifying the usage of complex subsystems.*/
// B. Adapter
/*Allows objects with incompatible interfaces to collaborate by converting the interface of one class into another interface that clients expect.*/

// 3. Behavioral Patterns:
// A. Observer
/* Defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically. */

// SinglteonL

// Create singled with Static Constant
class NetworkManager {
    static let shared = NetworkManager()
    private init() {
    }
    
    func fetchData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
          let task = URLSession.shared.dataTask(with: url) { data, response, error in
              completion(data, error)
          }
          task.resume()
      }
}

NetworkManager.shared.fetchData(from: URL(string: "www.google.com")!) { data, error in
    print(data as Any)
}

// Create singled with Static method
class NetworkManager1 {
   private static var instance: NetworkManager1?
    
    static func shared() -> NetworkManager1 {
        if(instance == nil) {
            instance = NetworkManager1()
        }
        return  instance!
    }
    
    private init() {
    }
    
    func fetchData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
          let task = URLSession.shared.dataTask(with: url) { data, response, error in
              completion(data, error)
          }
          task.resume()
      }
}

NetworkManager1.shared().fetchData(from: URL(string: "www.google.com")!) { data, error in
    print(data as Any)
}

// Create singled using lazy Initialization
class NetworkManager2 {
     static var shared: NetworkManager2 = {
        return NetworkManager2()
    }()
    
    private init() {
        
    }
    
    func fetchData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
          let task = URLSession.shared.dataTask(with: url) { data, response, error in
              completion(data, error)
          }
          task.resume()
      }
}

NetworkManager2.shared.fetchData(from: URL(string: "www.google.com")!) { data, error in
    print(data as Any)
}

// Most common uses are in NetworkManager, ConfigurationManager, centarlized logging, shared data cache, User session management, etc.


// Factory design Pattern
/*The Factory Design Pattern is a creational design pattern that provides an interface for creating objects in a superclass but allows subclasses to alter the type of objects that will be created. The Factory Pattern is particularly useful when the exact type of the object cannot be determined until runtime.*/

//protocol Vehical {
//    var name: String {get}
//    func drive()
//}
class Vehical {
    var name:String
    init(name: String) {
        self.name = name
    }
    func drive() {
        print("drive")
    }
}

class Car: Vehical {
    func getAcInformaytion() -> String {
        return "AC is working"
    }
}

class Bike: Vehical {
    func isHelmet() -> Bool {
        return true
    }
}

enum VehicalTypes {
    case Car
    case Bike
}

class VehicalFactory {
    func getVehical(vehicalType: VehicalTypes) -> Vehical {
        if(vehicalType == .Car) {
            Car(name: "Audi")
        } else {
            Bike(name: "Suzuki")
        }
    }
}

let car = VehicalFactory().getVehical(vehicalType: .Car)
car.drive()

let bike = VehicalFactory().getVehical(vehicalType: .Bike)
bike.drive()

if(car is Car) {
    print("It is a car")
    let localCar : Car = car as! Car
    localCar.getAcInformaytion()
}

let dynamicType = type(of: car)

// Structral design Pattern
// Adapter design pattern
/* The Adapter pattern allows objects with incompatible interfaces to collaborate. It acts as a bridge between the two incompatible interfaces, making them compatible with each other. */

class LegacyPrinter {
    
    func printMessage(message: [String: String]) {
        print(message["text"] as Any)
    }
}

class ModernPrinter {
    func printMessage(text: String) {
        print(text)
    }
}

class AdapterPrinter: ModernPrinter {
    private let legacyPrinter: LegacyPrinter
       
    init(legacyPrinter: LegacyPrinter) {
      self.legacyPrinter = legacyPrinter
    }
    override func printMessage(text: String) {
        let message = ["text":text]
        legacyPrinter.printMessage(message: message)
    }
}
let legacyPrinter = LegacyPrinter()
legacyPrinter.printMessage(message: ["text":"hello"])

let modernPrinter = ModernPrinter()
modernPrinter.printMessage(text: "hello")

let adapterPrinter = AdapterPrinter(legacyPrinter: legacyPrinter)
adapterPrinter.printMessage(text: "please print with adapter")


// facade Pattern
/*
 The Facade pattern provides a simplified interface to a complex system of classes, making it easier to use.

 Example: Media Player Facade
 Suppose we have a media player system that consists of multiple components such as an audio player, video player, and playlist manager. We can create a facade to provide a single interface for the client to interact with the media player system.
 */
// Subsystem Components
class AudioPlayer {
    func playAudio() {
        print("Playing audio")
    }
}

class VideoPlayer {
    func playVideo() {
        print("Playing video")
    }
}

class PlaylistManager {
    func playPlaylist() {
        print("Playing playlist")
    }
}

// Facade for Media Player System
class MediaPlayerFacade {
    private let audioPlayer = AudioPlayer()
    private let videoPlayer = VideoPlayer()
    private let playlistManager = PlaylistManager()
    
    func playAudio() {
        audioPlayer.playAudio()
    }
    
    func playVideo() {
        videoPlayer.playVideo()
    }
    
    func playPlaylist() {
        playlistManager.playPlaylist()
    }
}

// Usage
let mediaPlayer = MediaPlayerFacade()
mediaPlayer.playAudio() // Output: Playing audio
mediaPlayer.playVideo() // Output: Playing video
mediaPlayer.playPlaylist() // Output: Playing playlist

//Behavioural Pattern
// 1. Observer Pattern

/*
 There are three importnat thing for observer pattern
 1. protocol
 2. Subject
 3. Observerable
 
 Protocol define blue print of methods that would be trigered to notify other subscribers
 Subject is the one taht add the observer to themself, if something chnage then it notify to subscribers
 Observer is the class that inherit the protocol and recieve triggered methods
 
 */

protocol Observer {
    func updateValue(value:String)
}

class Subject {
    private var value = ""
    private var observers = [Observer]()
    
    func addObssrver(observer: Observer) {
        observers.append(observer)
    }
    
    func notifyObserver() {
        for observer in observers {
            observer.updateValue(value: value)
        }
    }
    
    func updateValue(value:String) {
        self.value = value;
        notifyObserver()
    }
}

class ConcreteObserver:Observer {
    func updateValue(value: String) {
        print(value)
    }
    
}

let subject = Subject()
let concreteObserver = ConcreteObserver()
subject.addObssrver(observer: concreteObserver)
subject.updateValue(value: "Notified Value works")

