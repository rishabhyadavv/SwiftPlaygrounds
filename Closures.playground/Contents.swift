import UIKit

var greeting = "Hello, playground"
var closure1 = {
    print("welcole to closures")
}
print(closure1())

typealias closure = (Int, Int)-> Int
typealias closure2 = (Int)->Void


let addClosure: (Int, Int)-> Int = { (a,b) in
   return a+b
}
addClosure(4,5)

func addCalculation(compl:closure2) {
    let add = addClosure(2,4)
    compl(add)
}

addCalculation { value in
    print("sum is",value)
}

let multipleClosure:(Int, Int)-> Int = { (a,b) in
    return a*b
}

let calculationClosure: (Int, Int, (Int, Int)-> Int)-> Int = { (a,b, inputClosures) in
   return  inputClosures(a, b)
}

func calculationClosureFunc(a:Int, b:Int, inputClosures:(Int, Int)-> Int )-> Int {
    return  inputClosures(a, b)
}

func calculationClosureFuncCapturingValues(a:Int, b:Int)-> ()-> Int {
    var result = 0;
    return {
        result += multipleClosure(a,b)
        return result
    }
}

let calculationFuncClosure = calculationClosureFuncCapturingValues(a:2,b:3)
calculationFuncClosure()
calculationFuncClosure()

let multiple = multipleClosure(2,3)
let multipleCl = calculationClosureFunc(a: 2,b: 3, inputClosures: multipleClosure)
let addresult = calculationClosureFunc(a: 2,b: 3, inputClosures: addClosure)

calculationClosureFunc(a: 2, b: 3) { a, b in
    return a+b
}



func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var total = 0
    return {
        total += amount
        return total
    }
}

let incrementByTwo = makeIncrementer(forIncrement: 2)
print(incrementByTwo) // Prints: 2
//print(incrementByTwo()) // Prints: 4


func downloadImage(from urlString: String, completion: (UIImage?) -> Void) {
    guard let url = URL(string: urlString) else {
        completion(nil)
        return
    }
    print("start download the image", urlString)

    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data, let image = UIImage(data: data) else {
            completion(nil)
            return
        }
        completion(image)
    }.resume()
}

// Two ways to call this on async
let globalQueue = DispatchQueue.global()
let imageUrl = "http://placehold.it/120x120&text=image1"
globalQueue.async {
    downloadImage(from: imageUrl) { image in
        if let _ = image {
                      // Do something with the downloaded image
                      print("Downloaded image: \(imageUrl)")
                  } else {
                      print("Failed to download image: \(imageUrl)")
                  }
    }
}


