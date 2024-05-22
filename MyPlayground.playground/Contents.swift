import UIKit

final class ArrayRef<Element> {
    var element: Element
    init(element: Element) {
        self.element = element
    }
}
struct MyArray<Element> {
    private var refElements: ArrayRef<[Element]>

    init(_ elements: [ArrayRef<Element>]) {
        refElements = ArrayRef(element: elements)
    }

    mutating func append(_ element: Element) {
        if !isKnownUniquelyReferenced(&refElements) {
            // If elements is shared, make a copy before mutating
            refElements = refElements + element
        } else {
            // If elements is not shared, just append to it directly
            elements.append(element)
        }
    }

    func printElements() {
        print(refElements)
    }
}

// Create an instance of MyArray
var array1 = MyArray([1, 2, 3])

// Create another instance referencing the same array
var array2 = array1

// Modify array2
array2.append(4)

// Since array2 was modified, a copy was made, and array1 remains unchanged
print("Array 1:")
array1.printElements() // Output: [1, 2, 3]
print("Array 2:")
array2.printElements() // Output: [1, 2, 3, 4]
