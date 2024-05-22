import UIKit

// Basic

//enum CompassDirection {
//    case north
//    case south
//    case east
//    case west
//}
//
//func getDirectionsDetails(direction: CompassDirection)-> String {
//    var directionDetails = ""
//    switch direction {
//    case .north:
//        directionDetails = "this way direction north"
//    case .south:
//        directionDetails = "this way direction south"
//    case .east:
//        directionDetails = "this way direction east"
//    case .west:
//        directionDetails = "this way direction west"
//    }
//    return directionDetails;
//}
//
//getDirectionsDetails(direction: .east)

// associated values

//enum CompassDirection {
//    case north(Bool)
//    case south
//    case east
//    case west
//}
//
//func getDirectionsDetails(direction: CompassDirection)-> String {
//    var directionDetails = ""
//    switch direction {
//    case .north(let closed) where closed :
//        directionDetails = "This path is closed"
//    case .south:
//        directionDetails = "this way direction south"
//    case .east:
//        directionDetails = "this way direction east"
//    case .west:
//        directionDetails = "this way direction west"
//    case .north:
//        directionDetails = "this way direction north"
//        
//    }
//    return directionDetails;
//
//}
//
//getDirectionsDetails(direction: .north(true))
//
//enum CompassDirection: String {
//    case north = "this way direction north"
//    case south = "this way direction south"
//    case east
//    case west
//}
//
//func getDirectionsDetails(direction: CompassDirection)-> String {
//    var directionDetails = ""
//    switch direction {
//    case .south, .north:
//        directionDetails = direction.rawValue
//    case .east:
//        directionDetails = "this way direction east"
//    case .west:
//        directionDetails = "this way direction west"
//        
//    }
//    return directionDetails;
//
//}
//
//getDirectionsDetails(direction: .north)
//
//enum CompassDirection: String {
//    case north = "this way direction north"
//    case south = "this way direction south"
//    case east
//    case west
//    
//    func getDirectionsDetails()-> String {
//        var directionDetails = ""
//        switch self {
//        case .south, .north:
//            directionDetails = self.rawValue
//        case .east:
//            directionDetails = "this way direction east"
//        case .west:
//            directionDetails = "this way direction west"
//            
//        }
//        return directionDetails;
//
//    }
//}
//
//let currentDirection = CompassDirection.north
//currentDirection.getDirectionsDetails()



enum CompassDirection: String {
    case north = "this way direction north"
    case south = "this way direction south"
    case east
    case west
    
    mutating func swapDirections() {
        switch self {
        case .south:
            self = .north
        case .north:
            self = .south
            
        case .east:
            self = .east
        case .west:
            self = .west
        }
    }
}

var currentDirection = CompassDirection.north;
currentDirection.swapDirections()
