import UIKit

class Shape {
    let width: Double
    let height: Double

    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }

    func area() -> Double {
        return width * height
    }
}

// This works perfectly for reactangle, square
let rectangle = Shape(width: 50, height: 50)
rectangle.area()


// Now i want to do that for circle also, but area function looks static here
// We have to write a new function of area for Circle here. This means that we are modifying the existing class that violates the open/closed principal.
// What can we do here? Protocols save us. Let\s refactor this

protocol UniversalShape {
    func area()-> Double
}

class Rectangle:UniversalShape {
    let width: Double
    let height: Double

    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }

    func area() -> Double {
        return width * height
    }
}

class Circle: UniversalShape {
    let radius: Double

    init(radius: Double) {
        self.radius = radius
    }

    func area() -> Double {
        return Double.pi * radius * radius
    }
}

let rectangle1 = Rectangle(width: 50, height: 50)
rectangle.area()

let circle = Circle(radius: 50)
circle.area()

